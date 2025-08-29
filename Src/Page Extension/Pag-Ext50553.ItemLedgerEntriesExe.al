pageextension 50553 "Item Ledger Entries Exe" extends "Item Ledger Entries"
{
    layout
    {
        addafter("Document Type")
        {
            field("Quatation No."; Rec."Quatation No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Quatation No. field.', Comment = '%';
            }
            field("Quatation Line No."; Rec."Quatation Line No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Quatation Line No. field.', Comment = '%';
            }
        }
    }
}
