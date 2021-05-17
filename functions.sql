CREATE OR REPLACE FUNCTION get_state(_zip integer)
RETURNS VARCHAR(2)
AS
$$
DECLARE
    state VARCHAR(2);
    last_two_numbers_of_zip INTEGER;
    count_of_iterations INTEGER;
BEGIN
    SELECT state_code INTO state FROM zip WHERE zip.zip = _zip;

    if FOUND then
        return state;
    end if;

    last_two_numbers_of_zip := mod(_zip, 100);
    count_of_iterations := 99 - last_two_numbers_of_zip;

    for zip_of_nearest_city in _zip..(_zip + count_of_iterations) loop
        SELECT state_code INTO state FROM zip WHERE zip.zip = zip_of_nearest_city;

        if FOUND then
            return state;
        end if;

    end loop;

    return NULL;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_region(_zip integer)
RETURNS VARCHAR(2)
AS
$$
DECLARE
    state VARCHAR(2);
    _region VARCHAR(2);
BEGIN
    state := get_state(_zip);
    SELECT region INTO _region FROM state_region WHERE state_code = state;

    return _region;
END;
$$ LANGUAGE plpgsql;

-- TEST CASES:
/*
    * Пояснение "Ближайший zip code":
        В таблице zip каждому zip code в соответствие ставится название города city и названия штата state.
        Сам zip code представляет собой пяти разрядное десятичное (или меньше) число, в котором
        первые три разряда идентифицируют штат state, последние же два разряда идентифицируют город city,
        относящийся к штату state.
        Таким образом zip code первые три разряда которых совпадают отображают один штат state.

        Определение "Ближайший zip code":
        zip code A будет являтся "ближайшим" к zip code B, если zip code A как число больше zip code B. При этом
        первые три разряда как zip code A, так и zip code B будут одинаковыми.
        Пример:
        Пусть zip code A = 30212, тогда zip codes: 30213, 30245, 30299 и т.п. будут ближайшими по отношению к zip code A.
        zip codes: 4034, 30313, 24134 не будут являтся ближайшими по отношению к zip code A, так как они относятся к
        другим штатам state.

    * TEST CASES FOR get_state(zip: integer): varchar
        1. В качестве zip передать zip code, который не существует в таблице [zip] и не имеет ближайших zip code.
        Ожидаемый результат: null.

        2. В качестве zip передать zip code, который не существует в таблице [zip], но имеет хотя бы один ближайший zip code.
        Ожидаемый результат: state: varchar ближайшего zip code.

        3. В качестве zip передать zip code, который существует в таблице [zip].
        Ожидаемый результат: state: varchar, соответствующий zip code.

    * TEST CASES FOR get_region(zip: integer): varchar
        1. В качестве zip передать zip code, который не существует в таблице [zip] и не имеет ближайших zip code.
        Ожидаемый результат: null.

        2. В качестве zip передать zip code, который не существует в таблице [zip], но имеет хотя бы один ближайший zip code.
        Ожидаемый результат: region: varchar, который соответсвует штату state ближайшего zip code.

        3. В качестве zip передать zip code, который существует в таблице [zip].
        Ожидаемый результат: region: varchar, который соответствует state, соотвествующий в свое очередь zip code.

        4. В качестве zip передать zip code, который существует в таблице [zip]. При этом штат, которому соответствует
        переданный zip code, существует в таблице [state_region].
        Ожидаемый результат: region: varchar, который соответствует state, соотвествующий в свое очередь zip code.

        5. В качестве zip передать zip code, который существует в таблице [zip]. Но штат, которому соответствует
        переданный zip code, не существует в таблице [state_region].
        Ожидаемый результат: null.

-- DATABASE OPTIMIZATION
    Как минимум можно добавить связь между таблицами zip и state_region по state_code, которая сама собой напрашивается.

    Тогда можно было бы переписать функцию get_region, чтобы та в свою очередь не делала дополнительный запрос, чтобы
    достать region из таблицы state_region. А просто джойнила данные из нее при поиске соответсвия zip code и state.
    Но в таком случае не получилось бы просто использовать реализацию функции get_state. Нужно было бы копировать часть
    реализации из функции get_state в get_region и дописывать INNER JOIN к запросу.
 */