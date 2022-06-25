CREATE OR REPLACE PACKAGE BODY HR.pkg_dep_dml is

  -- Private type declarations
/*  type <TypeName> is <Datatype>;
  
  -- Private constant declarations
  <ConstantName> constant <Datatype> := <Value>;

  -- Private variable declarations
  <VariableName> <Datatype>;

  -- Function and procedure implementations
  function <FunctionName>(<Parameter> <Datatype>) return <Datatype> is
    <LocalVariable> <Datatype>;
  begin
    <Statement>;
    return(<Result>);
  end;*/

    Procedure p_q(r In Out ref_dept, p_dept Number, loc_id Number) Is
    Begin
       
          Open r For
            Select * from departments d 
             Where d.department_id = nvl(p_dept,d.department_id)
            ;
      End;
    
      Procedure p_ins(t In tab_dept) Is
        Begin
          For i In 1..t.count() Loop
          Insert Into departments(department_id, department_name, manager_id, location_id)
                  Values(t(i).department_id, t(i).department_name, t(i).manager_id, t(i).location_id );
          End Loop;
        End;

     Procedure p_del(t In tab_dept) Is
       Begin
         For i In 1..t.count() Loop
         Delete From departments d
          Where d.department_id = t(i).department_id;
         End Loop;
       End ;
       
    Procedure p_loc(t In tab_dept) Is
       rec rec_dept;
      Begin
        For i In 1..t.count() Loop
          Select * 
            Into rec
            From departments d 
        Where d.department_id = t(i).department_id;
        End Loop;
        End;

   Procedure p_upd(t In tab_dept) Is
     rec rec_dept;
     Begin
       For i In 1..t.count() Loop
       Update departments  d
          Set location_id = t(i).location_id
        Where d.department_id = t(i).department_id;
        End Loop;
        End;
       

begin
  -- Initialization
  Null;
end pkg_dep_dml;

/