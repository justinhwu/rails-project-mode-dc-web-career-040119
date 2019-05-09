Main List
<!-- 1. Create Logout button -->
<!-- 2. Add in Passwords -->
<!-- 3. Authentications: -->
  <!-- - Validate that username doesn't already exist when creating a new user (unique username, case sensitivity) -->
  <!-- - No empty fields when creating new user -->
  <!-- - Login page - error message if username doesn't exit -->
  <!-- - Login page - error message if password is incorrect -->
4. Create function that allows user to buy an item
  <!-- - Once user buys an item, update item record to reflect change -->
  - Updating the cart to change amount of wanted items
  <!-- - Deleting items from cart -->
5. Displaying supplier details on item page
6.

Stretch Features
1. Dynamic updates for quantity if item is sold out
2. Two-factor authentication to verify
3. Admin features
4. If item is out of stock, sets off some sort of timer that allows supplier to be contacted and resupplies that item
5. Checkout as guest -> creates session id for them

<% @purchases.each do |purchase|%>
<%= form_tag "/order/#{purchase.id}", method: 'patch' do %>
  <%= hidden_field_tag purchase.incart?, true %>
  <%= hidden_field_tag :inventory_id, purchase.inventory_id%>
  <%= hidden_field_tag :customer_id, session[:customer_id]%>
  <%= hidden_field_tag :purchased_quantity, purchase.purchased_quantity%>
  <%= submit_tag "Place your order"%>
<% end %>
<% end %>
