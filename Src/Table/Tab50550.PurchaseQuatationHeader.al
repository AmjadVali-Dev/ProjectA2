table 50550 "Purchase Quatation Header"
{
    Caption = 'Purchase Quatation Header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            TableRelation = Vendor."No.";
            trigger OnValidate()
            var
                VendorRec: Record Vendor;
            begin
                if VendorRec.Get("Vendor No.") then
                    Rec."Vendor Name" := VendorRec.Name;
            end;
        }
        field(3; "Vendor Name"; Text[100])
        {
            Caption = 'Vendor Name';
        }
        field(4; "Quatation Date"; Date)
        {
            Caption = 'Quatation Date';
        }
        field(5; Status; Enum "Quatation Status Enum")
        {
            Caption = 'Status';
            Editable = false;
        }
        field(6; "Created By"; Code[20])
        {
            Caption = 'Created By';
        }
        field(7; "Creation Date"; Date)
        {
            Caption = 'Creation Date';
        }
        field(8; "Creation Time"; Time)
        {
            Caption = 'Creation Time';
        }
        field(9; "Accepted By"; Code[50])
        {
            Caption = 'Accepted By';
        }
        field(10; "Accepted Date"; Date)
        {
            Caption = 'Accepted Date';
        }
        field(11; "Accepted Time"; Time)
        {
            Caption = 'Accepted Time';
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        NoGenRec: Codeunit "Purchase No. CodeUnit";
    begin
        NoGenRec.PurchaseNoGen(Rec);
        "Quatation Date" := WorkDate();
        "Created By" := UserId;
        "Creation Date" := WorkDate();
        "Creation Time" := Time;
    end;

    trigger OnDelete()
    var
        PurchaseQalinRec: Record "Purchase Quotaion Lin";
    begin
        if Rec.Status = Status::Open then begin
            PurchaseQalinRec.SetRange("No.", Rec."No.");
            PurchaseQalinRec.DeleteAll();
            Message('%1 Record & All Lines Is Successfully Deleted', Rec."No.");
        end
        else
            Error('We Cant Delete Because the Status Is Not Open');
    end;

    procedure CreatePurchaseOrderFromQuotation(QuotationHeader: Record "Purchase Quatation Header")
    var
        PurchHeader: Record "Purchase Header";
        PurchLine: Record "Purchase Line";
        QuotationLine: Record "Purchase Quotaion Lin";
    begin
        PurchHeader.Init();
        PurchHeader.Validate("Document Type", PurchHeader."Document Type"::Quote);
        PurchHeader.Validate("Buy-from Vendor No.", QuotationHeader."Vendor No.");
        PurchHeader.Insert(true);
        QuotationLine.SetRange("No.", QuotationHeader."No.");
        if QuotationLine.FindSet() then begin
            repeat
                PurchLine.Init();
                PurchLine.Validate("Document Type", PurchLine."Document Type"::Quote);
                PurchLine.Validate("Document No.", PurchHeader."No.");
                PurchLine.Validate("Line No.", QuotationLine."Line No.");
                PurchLine.Validate(Type, PurchLine.Type::Item);
                PurchLine.Validate("No.", QuotationLine."Item No.");
                PurchLine.Validate(Quantity, QuotationLine.Quantity);
                PurchLine."Quotattion_No." := PurchHeader."No.";
                PurchLine."Quotation Line_No." := PurchLine."Line No.";
                PurchLine.Insert(true);
            until QuotationLine.Next() = 0;
        end;
        PAGE.Run(Page::"Purchase Quote", PurchHeader);
    end;
}
