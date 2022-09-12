CREATE PROCEDURE proc_UnclosedCursorFirstFailedEx
AS
    BEGIN
        DECLARE MyFirstFailedCursor CURSOR
        FOR SELECT *
            FROM FirstTable;
        OPEN MyFirstFailedCursor;
        FETCH NEXT FROM MyFirstFailedCursor;
    END;
GO
CREATE PROCEDURE proc_UnclosedCursorSecondFailedEx
AS
    BEGIN
        DECLARE MySecondFailedCursor CURSOR
        FOR SELECT *
            FROM FirstTable;
        OPEN MySecondFailedCursor;
        FETCH NEXT FROM MySecondFailedCursor;
    END;
GO
CREATE PROCEDURE proc_UnclosedCursorFirstGoodEx
AS
    BEGIN
        DECLARE MyFirstGoodCursor CURSOR
        FOR SELECT *
            FROM FirstTable;
        OPEN MyFirstGoodCursor;
        FETCH NEXT FROM MyFirstGoodCursor;
        CLOSE MyFirstGoodCursor;
        DEALLOCATE MyFirstGoodCursor;
    END;
GO
CREATE PROCEDURE proc_UnclosedCursorSecondGoodEx
AS
    BEGIN
        DECLARE MySecondGoodCursor CURSOR
        FOR SELECT *
            FROM SecondTable;
        OPEN MySecondGoodCursor;
        FETCH NEXT FROM MySecondGoodCursor;
        CLOSE MySecondGoodCursor;
        DEALLOCATE MySecondGoodCursor;
    END;
GO