CLASS zcl_hello_world_000 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS ZCL_HELLO_WORLD_000 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    MODIFY ENTITIES OF i_timesheettp ENTITY timesheet
*    CREATE AUTO FILL CID
*    SET FIELDS WITH VALUE #( (
*     workassignmentexternalid = 'EMPLOYEE'
*     country2digitisocode = 'KO'
*     timesheetdate = cl_abap_context_info=>get_system_date(  )
*     recordedhours = '08'
*     hoursunitofmeasure = 'H'
*     timesheetrecordlongtext = 'Test Note'
*     wbselementinternalid = '00218575'
*     activitytype = 'T001'
*     billingcontrolcategory = 'NON_BILL'
*     workitem = 'P002' ) )
*    MAPPED DATA(mapped)
*    FAILED DATA(failed)
*    REPORTED DATA(reported).

*    MODIFY ENTITIES OF i_timesheettp ENTITY timesheet
*    CREATE AUTO FILL CID
*    SET FIELDS WITH VALUE #( (
*     workassignmentexternalid = 'EMPLOYEE'
*     country2digitisocode = 'KR'
*     timesheetdate = cl_abap_context_info=>get_system_date(  )
*     recordedhours = '08'
*     hoursunitofmeasure = 'H'
*     timesheetrecordlongtext = 'Test Note'
*     wbselementinternalid = '00000005'
*     activitytype = 'T001'
*     billingcontrolcategory = 'NON_BILL'
*     workitem = 'P002' ) )
*    MAPPED DATA(mapped)
*    FAILED DATA(failed)
*    REPORTED DATA(reported).

    MODIFY ENTITIES OF i_timesheettp ENTITY timesheet
           CREATE AUTO FILL CID
           SET FIELDS WITH VALUE #( (
               workassignmentexternalid = 'MIRI.LEE'
               country2digitisocode     = 'KR'
               timesheetdate            = '20240223'
               recordedhours            = '0.25'
               hoursunitofmeasure       = 'H'
               timesheetrecordlongtext  = 'Test Note'
               wbselementinternalid     = '00000005' "어디에서 가져온다. (수형)
               activitytype             = 'T001'
               billingcontrolcategory   = ' '
               workitem                 = ' ' ) )
           MAPPED DATA(mapped)
           FAILED DATA(failed)
           REPORTED DATA(reported).
*
*    " persist changes
    COMMIT ENTITIES
        RESPONSE OF i_timesheettp
        FAILED DATA(failed_commit)
        REPORTED DATA(reported_commit).
*
*    " console output
*    out->write( |--------------------------------------------- | ).
*
*    IF failed IS NOT INITIAL.
*      out->write( |- Cause for failed activate: { failed-timesheet[ 1 ]-%fail-cause } | ).
*    ELSEIF failed_commit IS NOT INITIAL.
*      out->write( |- Cause for failed commit: { failed_commit-timesheet[ 1 ]-%fail-cause } | ).
*    ENDIF.

*    SELECT FROM i_journalentrytp
*       FIELDS companycode
*       INTO TABLE @DATA(itab).

*    SELECT FROM yy1_cops_employee
*       FIELDS /sap/1_authorizationgroup
*       INTO TABLE @DATA(itab).


    out->write( |--------------------------------------------- | ).

  ENDMETHOD.
ENDCLASS.
