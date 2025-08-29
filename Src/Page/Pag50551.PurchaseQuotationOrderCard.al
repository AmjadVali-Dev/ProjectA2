page 50551 "Purchase Quotation Order Card"
{
    ApplicationArea = All;
    Caption = 'Purchase Quotation Order Card';
    PageType = Card;
    SourceTable = "Purchase Quatation Header";
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ToolTip = 'Specifies the value of the Vendor No. field.', Comment = '%';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ToolTip = 'Specifies the value of the Vendor Name field.', Comment = '%';
                }
                field("Quatation Date"; Rec."Quatation Date")
                {
                    ToolTip = 'Specifies the value of the Quatation Date field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field("Created By"; Rec."Created By")
                {
                    ToolTip = 'Specifies the value of the Created By field.', Comment = '%';
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ToolTip = 'Specifies the value of the Creation Date field.', Comment = '%';
                }
                field("Creation Time"; Rec."Creation Time")
                {
                    ToolTip = 'Specifies the value of the Creation Time field.', Comment = '%';
                }
                field("Accepted By"; Rec."Accepted By")
                {
                    ToolTip = 'Specifies the value of the Accepted By field.', Comment = '%';
                }
                field("Accepted Date"; Rec."Accepted Date")
                {
                    ToolTip = 'Specifies the value of the Accepted Date field.', Comment = '%';
                }
                field("Accepted Time"; Rec."Accepted Time")
                {
                    ToolTip = 'Specifies the value of the Accepted Time field.', Comment = '%';
                }
            }
            part("Purchase Quotation Order Subform"; "Purchase Quota Order Subform")
            {
                ApplicationArea = All;
                Caption = 'Purchase Quotation Order Subform';
                SubPageLink = "No." = field("No.");
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(CreatePurchaseQuote)
            {
                Caption = 'Create Purchase Quote';
                ApplicationArea = All;
                Image = NewDocument;
                trigger OnAction()
                begin
                    Rec.CreatePurchaseOrderFromQuotation(Rec);
                end;
            }
        }
    }
}

