pageextension 50554 "Purchase Subform Exe" extends "Purchase Order Subform"
{
    layout
    {
        addafter(Description)
        {
            field("Quotattion_No."; Rec."Quotattion_No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Quotattion_No. field.', Comment = '%';
            }
            field("Quotation Line_No."; Rec."Quotation Line_No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Quotation Line_No. field.', Comment = '%';
            }
        }
    }
}
