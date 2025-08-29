tableextension 50553 "Item Ledger Entry Exe" extends "Item Ledger Entry"
{
    fields
    {
        field(50550; "Quatation No."; Code[20])
        {
            Caption = 'Quatation No.';
            DataClassification = ToBeClassified;
        }
        field(50551; "Quatation Line No."; Integer)
        {
            Caption = 'Quatation Line No.';
            DataClassification = ToBeClassified;
        }
    }
}
