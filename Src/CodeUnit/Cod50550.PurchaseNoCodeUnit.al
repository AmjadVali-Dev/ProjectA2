codeunit 50550 "Purchase No. CodeUnit"
{
    procedure PurchaseNoGen(var PurchaseHeader: Record "Purchase Quatation Header")
    var
        PurchasePayRec: Record "Purchases & Payables Setup";
        NoSeries: Codeunit "No. Series";
    begin
        if PurchaseHeader."No." = '' then begin
            PurchasePayRec.Get();
            PurchasePayRec.TestField("Quatation Nos.");
            PurchaseHeader."No." := NoSeries.GetNextNo(PurchasePayRec."Quatation Nos.", Today(), true);
        end;
    end;
}
