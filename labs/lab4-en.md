English - [Français](https://github.com/nasri-lab/security-jsp/blob/main/labs/lab4-fr.md)

# Lab 4: Understanding and Preventing XSS Attacks

## Objective
The objective of this lab is to understand Cross-Site Scripting (XSS) attacks, identify how they can be exploited in web applications, and learn the necessary steps to prevent them.

## Phase 1: Identifying XSS Vulnerabilities

### Step 0: Setup Environment
Ensure the project from the previous labs is up and running in your local environment.

### Step 1: Explore XSS Attack Vectors
Familiarize yourself with the different types of XSS attacks: Stored XSS, Reflected XSS, and DOM-based XSS. For this lab, we'll concentrate on Stored and Reflected XSS.

### Step 2: Identifying Vulnerable Points
1. Examine the code for `add-product.jsp` and `products.jsp`. Identify how user input is incorporated into the output without proper validation or encoding.
2. Create a malicious input containing JavaScript code, such as `<script>alert('XSS');</script>` or `<script>alert("XSS");</script>`, and submit it via the form on `add-product.jsp`.
3. Navigate to `products.jsp` and observe if the script executes, indicating an XSS vulnerability.

## Phase 2: Exploiting XSS Vulnerabilities

### Step 1: Craft Malicious Payload
Develop a sophisticated payload that performs an observable action, such as:

1. Altering page content (adding DOM elements): `<script>document.getElementById('').innerHTML="...";</script>`
2. Redirecting to a different website: `<script>window.location.href="...";</script>`.

### Step 2: Test the Payload
Submit your malicious payload through the `add-product.jsp` page and note its impact on the `products.jsp` page.

## Phase 3: Preventing XSS Attacks

### Step 1: Sanitize User Input
Implement input sanitization in `add-product.jsp` to strip or encode special characters from user inputs before processing or storing them. For this, implements prepared statements.

``` JSP
String sql = "INSERT INTO product (libelle, category_id, description) VALUES (?, ?, ?)";
pstmt = conn.prepareStatement(sql);

// Setting parameters
pstmt.setString(1, libelle);
pstmt.setInt(2, Integer.parseInt(categoryId)); // Assuming category_id is an integer
pstmt.setString(3, description);
```
### Step 2: Encode Output
Adjust `products.jsp` to encode special characters in the output. Utilize PHP's `htmlspecialchars()` function to safely encode user-generated content prior to display. 

### Step 3: Validate Input
Apply input validation where possible to ensure that data conforms to expected formats. For instance, verify:
1. Numeric fields to confirm they contain only numbers before processing.
2. Email fields to confirm they contain only emails before processing.
3. etc.

## Phase 4: Testing Fixes

### Step 1: Retest with Previous Payloads
Attempt to exploit the XSS vulnerability once more using the same payloads from Phase 2 to confirm that the vulnerability has been effectively addressed.

### Step 2: Review and Understand the Fixes
Review how input sanitization, output encoding, and validation help prevent XSS vulnerabilities and secure web applications.