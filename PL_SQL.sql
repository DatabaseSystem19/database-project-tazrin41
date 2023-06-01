//variable declare
set serveroutput on
declare 
Child_ID integer;
Child_Name CHILD_INFORMATION.CHILD_NAME%type;
Age_Child number;
begin
select Child_ID,Child_Name,Age_Child into Child_ID,Child_Name,Age_Child  from Child_Information where Child_ID=1005;
dbms_output.put_line('Child_ID: '||Child_ID|| ' Child_Name: '||Child_Name|| ' Age_Child: '||Age_Child);
end;
/

//rowtype and show output
set serveroutput on
declare 
Child_Care_Centre_row Child_Health_Care%rowtype;
begin
select Branch_ID,Centre_Name,Location into Child_Care_Centre_row.Branch_ID,Child_Care_Centre_row.Centre_Name,Child_Care_Centre_row.Location from Child_Care_Centre where Child_ID=1005;
dbms_output.put_line('Branch_ID: '||Child_Care_Centre_row.Branch_ID|| 'Centre_Name: '||Child_Care_Centre_row.Centre_Name || ' location: '||Child_Care_Centre_row.Location);
end;
/
//cursor and row count
set serveroutput on
DECLARE
    CURSOR child_cursor IS
        SELECT * FROM Child_Information;
    child_record Child_Information%ROWTYPE;
    child_count NUMBER := 0;
BEGIN
    OPEN child_cursor;
    
    LOOP
        FETCH child_cursor INTO child_record;
        EXIT WHEN child_cursor%NOTFOUND;
        
        -- Process each fetched row
        -- For example, you can print the Child_Name
        DBMS_OUTPUT.PUT_LINE('Child Name: ' || child_record.Child_Name);
        
        -- Increment the row count
        child_count := child_count + 1;
    END LOOP;
    
    CLOSE child_cursor;
    
    -- Print the total row count
    DBMS_OUTPUT.PUT_LINE('Total Child Count: ' || child_count);
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
//procedure
CREATE OR REPLACE PROCEDURE InsertChildInformation(
    child_id_param IN INT,
    child_name_param IN VARCHAR2,
    child_age_param IN INT,
    parent_name_param IN VARCHAR2,
    contact_param IN VARCHAR2,
    address_param IN VARCHAR2,
    requirement_param IN VARCHAR2
)
AS
BEGIN
    INSERT INTO Child_Information (Child_ID, Child_Name, Child_Age, Parent_Name, Contact, Address, Requirement)
    VALUES (child_id_param, child_name_param, child_age_param, parent_name_param, contact_param, address_param, requirement_param);
    
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Child information inserted successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK;
END;
/
BEGIN
    InsertChildInformation(1011, 'Tausif', 8, 'Motiar Rahman', '01889688703', 'Narshingdi,Bangladesh', 'Education Care');
END;
/


//function
CREATE OR REPLACE FUNCTION CalculateTotalSum
    RETURN NUMBER
AS
    total_sum NUMBER;
BEGIN
    SELECT SUM(Total) INTO total_sum FROM Total_ID;
    
    RETURN total_sum;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        RETURN NULL;
END;
/
DECLARE
    total_sum NUMBER;
BEGIN
    total_sum := CalculateTotalSum();
    DBMS_OUTPUT.PUT_LINE('Total Sum: ' || total_sum);
END;
/

