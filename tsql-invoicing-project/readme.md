# Invoicing DB System

## Invoicing System - Business Objectives
> SME (Subject matter Expert) / BA (Business Analyst) Notes
* Products management
* Invoice management
    * Invoice details
    * Invoice Line Items
* Handle various invoice operations such as
    * List available Products
    * Provide mechanisms to add to cart
    * Provide mechanisms edit cart contents (add and remove products)
    * Checkout (calculate bill)

## Invoicing System - Technical Deliverables
> Data Architect / Team Lead Notes
* Products management
    * Products Table
    * Procedures to handle product data changes
    * Views to query products table data in various prespectives.
* Invoice management
    * Create tables for 
        * Customers
        * Invoice
        * Invoice_line_items
    * Procedures for Invoice Management
        * Create Invoice
            * Invoice ID
            * Customer Information
                * Name
                * Membership
                * Payment Methods
            * POS (Point of sale) information
                * StoreID
                * Date and Time
                * Calcluate invoice total    
        * Manage Invoice Line Items
            * Add item To cart
            * Remove item from cart
            * Remove all items from cart 
            * Calculate line item total

## DW Reporting System
* Objectives of the Reporting system
* **TBD**
