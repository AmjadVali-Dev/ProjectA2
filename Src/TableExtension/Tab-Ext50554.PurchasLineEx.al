tableextension 50554 "Purchas Line Ex" extends "Purchase Line"
{
    fields
    {
        field(50552; "Quotattion_No."; Code[20])
        {
            Caption = 'Quotattion_No.';
            DataClassification = ToBeClassified;
        }
        field(50553; "Quotation Line_No."; Integer)
        {
            Caption = 'Quotation Line_No.';
            DataClassification = ToBeClassified;
        }
    }
}
