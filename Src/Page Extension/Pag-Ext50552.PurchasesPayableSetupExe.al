pageextension 50552 "Purchases & Payable Setup Exe" extends "Purchases & Payables Setup"
{
    layout
    {
        addlast(content)
        {
            group("Quotation Fields")
            {
                field("Quatation Nos."; Rec."Quatation Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quatation Nos. field.', Comment = '%';
                }
            }
        }
    }
}
