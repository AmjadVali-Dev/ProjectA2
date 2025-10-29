table 50551 "Purchase Quotaion Lin"
{
    Caption = 'Purchase Quotaion Lin';
    DataClassification = ToBeClassified;

    fields
    {
        //this is The line Fields 
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;
            trigger OnValidate()
            var
                ItemRec: Record Item;
            begin
                if ItemRec.Get("Item No.") then begin
                    Description := ItemRec.Description;
                    "Unit Of Measure" := ItemRec."Base Unit of Measure";
                    "Direct Unit Cost" := ItemRec."Unit Cost";
                end;
            end;
        }
        field(4; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(5; "Unit Of Measure"; Code[10])
        {
            Caption = 'Unit Of Measure';
        }
        field(6; Quantity; Decimal)
        {
            Caption = 'Quantity';
            trigger OnValidate()
            begin
                "Line Amount" := Quantity * "Direct Unit Cost";
            end;
        }
        field(7; "Direct Unit Cost"; Decimal)
        {
            Caption = 'Direct Unit Cost';
        }
        field(8; "Line Amount"; Decimal)
        {
            Caption = 'Line Amount';
        }
        field(9; Status; Enum "Quatation Status Enum")
        {
            Caption = 'Status';
        }
    }
    keys
    {
        key(PK; "No.", "Line No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        PurchaseQuoHeader: Record "Purchase Quatation Header";
        PurchaseQuoLine: Record "Purchase Quotaion Lin";
    begin
        PurchaseQuoLine.SetRange("No.", "No.");
        if PurchaseQuoLine.FindLast() then
            "Line No." := PurchaseQuoLine."Line No." + 10000
        else
            "Line No." := 10000;
        PurchaseQuoHeader.SetRange("No.", "No.");
        if PurchaseQuoHeader.FindFirst() then
            Rec.Status := PurchaseQuoHeader.Status;
    end;
}
