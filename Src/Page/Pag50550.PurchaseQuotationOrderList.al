page 50550 "Purchase Quotation Order List"
{
    ApplicationArea = All;
    Caption = 'Purchase Quotation Order List';
    PageType = List;
    SourceTable = "Purchase Quatation Header";
    UsageCategory = Lists;
    CardPageId = "Purchase Quotation Order Card";
    layout
    {
        area(Content)
        {
            repeater(General)
            {
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
        }
    }
}
