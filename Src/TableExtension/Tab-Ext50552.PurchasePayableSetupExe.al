tableextension 50552 "Purchase & Payable Setup Exe" extends "Purchases & Payables Setup"
{
    fields
    {
        field(50550; "Quatation Nos."; Code[10])
        {
            Caption = 'Quatation Nos.';
            TableRelation = "No. Series";
        }
    }
}
