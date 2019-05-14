CREATE DATABASE TijucaDB;

CREATE TABLE [dbo].[BankTransfers] (
    [BankTransferId]                    INT            NOT NULL,
    [VersionTimestamp]                  ROWVERSION     NULL,
    [TransferDate]                      DATETIME       NULL,
    [TotalAmount]                       DECIMAL (8, 2) NULL,
    [Comments]                          NVARCHAR (500) NULL,
    [AmountTransfered]                  DECIMAL (8, 2) NULL,
    [BusinessBankAccount_BankTransfers] INT            NULL,
    PRIMARY KEY CLUSTERED ([BankTransferId] ASC)
);


CREATE TABLE [dbo].[BusinessBankAccounts] (
    [BankAccountId]      INT            NOT NULL,
    [VersionTimestamp]   ROWVERSION     NULL,
    [AccountNumber]      NVARCHAR (100) NULL,
    [AccountDescription] NVARCHAR (100) NULL,
    [Balance]            DECIMAL (8, 2) NULL,
    PRIMARY KEY CLUSTERED ([BankAccountId] ASC)
);

CREATE TABLE [dbo].[Expenses] (
    [ExpenseId]        INT        NOT NULL,
    [VersionTimestamp] ROWVERSION NULL,
    PRIMARY KEY CLUSTERED ([ExpenseId] ASC)
);

CREATE TABLE [dbo].[Inventories] (
    [InventoryId]      INT        NOT NULL,
    [VersionTimestamp] ROWVERSION NULL,
    [Quantity]         INT        NULL,
    PRIMARY KEY CLUSTERED ([InventoryId] ASC)
);

CREATE TABLE [dbo].[Items] (
    [ItemId]         INT            NOT NULL,
    [Code]           NVARCHAR (100) NULL,
    [Name]           NVARCHAR (500) NULL,
    [CostPrice]      DECIMAL (8, 2) NULL,
    [SalePrice]      DECIMAL (8, 2) NULL,
    [Inventory]      INT            NULL,
    [Supplier_Items] INT            NULL,
    PRIMARY KEY CLUSTERED ([ItemId] ASC)
);

CREATE TABLE [dbo].[OperatingExpenses] (
    [OperatingId]               INT            NOT NULL,
    [VersionTimestamp]          ROWVERSION     NULL,
    [Amount]                    DECIMAL (8, 2) NULL,
    [Description]               NVARCHAR (100) NULL,
    [IsMonthly]                 BIT            NULL,
    [Expense_OperatingExpenses] INT            NULL,
	[PaymentDate]    DATETIME   NULL,
    PRIMARY KEY CLUSTERED ([OperatingId] ASC)
);

CREATE TABLE [dbo].[PurchaseInvoices] (
    [PurchaseInvoiceId] INT            NOT NULL,
    [VersionTimestamp]  ROWVERSION     NULL,
    [Amount]            DECIMAL (8, 2) NULL,
    [BankTransfer]      INT            NULL,
	[Supplier]      	INT            NULL,
    PRIMARY KEY CLUSTERED ([PurchaseInvoiceId] ASC)
);

CREATE TABLE [dbo].[Purchases] (
    [PurchaseId]        INT            NOT NULL,
    [VersionTimestamp]  ROWVERSION     NULL,
    [Amount]            DECIMAL (8, 2) NULL,
    [Description]       NVARCHAR (100) NULL,
    [PurchaseDate]      DATETIME       NULL,
    [Item]              INT            NULL,
    [PurchaseInvoice]   INT            NULL,
    [Expense_Purchases] INT            NULL,
    PRIMARY KEY CLUSTERED ([PurchaseId] ASC)
);

CREATE TABLE [dbo].[Revenues] (
    [RevenueId]        INT            NOT NULL,
    [VersionTimestamp] ROWVERSION     NULL,
    [Amount]           DECIMAL (8, 2) NULL,
    PRIMARY KEY CLUSTERED ([RevenueId] ASC)
);

CREATE TABLE [dbo].[SalesInvoices] (
    [InvoiceId]        INT            NOT NULL,
    [InvoiceNumber]    NVARCHAR (100) NULL,
    [Amount]           DECIMAL (8, 2) NULL,
    [TaxRate]          NVARCHAR (100) NULL,
    [Discount]         DECIMAL (8, 2) NULL,
    [Paid]             BIT            NULL,
    [AwaitingApproval] BIT            NULL,
    [Date]             DATETIME       NULL,
    [DueDate]          DATETIME       NULL,
    [Reference]        NVARCHAR (100) NULL,
    [Branding]         NVARCHAR (100) NULL,
    [AwaitingPayment]  BIT            NULL,
    [DueAmount]        DECIMAL (8, 2) NULL,
    [Sent]             BIT            NULL,
    [BankTransfer]     INT            NULL,
	[Customer]		   INT            NULL,
    [Income_Invoices]  INT            NULL,
    PRIMARY KEY CLUSTERED ([InvoiceId] ASC)
);

CREATE TABLE [dbo].[SalesItems] (
    [SalesItemId]        INT NOT NULL,
    [Quantity]           INT NULL,
    [Item]               INT NULL,
    [Invoice_SalesItems] INT NULL,
    PRIMARY KEY CLUSTERED ([SalesItemId] ASC)
);

CREATE TABLE [dbo].[SupplierInfos] (
    [SupplierInfoId] INT            NOT NULL,
    [Address]        NVARCHAR (100) NULL,
    [Telephone]      NVARCHAR (100) NULL,
    [Email]          NVARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([SupplierInfoId] ASC)
);

CREATE TABLE [dbo].[Suppliers] (
    [SupplierId]   INT            NOT NULL,
    [Name]         NVARCHAR (100) NULL,
    [SupplierInfo] INT            NULL,
    PRIMARY KEY CLUSTERED ([SupplierId] ASC)
);

CREATE TABLE [dbo].[CustomerInfos] (
    [SupplierInfoId] INT            NOT NULL,
    [Address]        NVARCHAR (100) NULL,
    [Telephone]      NVARCHAR (100) NULL,
    [Email]          NVARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([SupplierInfoId] ASC)
);

CREATE TABLE [dbo].[Customers] (
    [CustomerId]   INT            NOT NULL,
    [Name]         NVARCHAR (100) NULL,
    [CustomerInfo] INT            NULL,
    PRIMARY KEY CLUSTERED ([SupplierId] ASC)
);
