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


<%= form_for :purchases do |f|%>
  <%= f.hidden_field :incart?, true%>
  <%= f.hidden_field :inventory_id %>
  <%= f.hidden_field session[:customer_id]%>
  <%= f.fields_for :inventories


  <% @purchases.each do |purchase|%>
    <%= form_tag "/order/#{purchase.id}", method: 'patch' do %>
      <%= hidden_field_tag :incart?, true%>
      <%= hidden_field_tag :inventory_id, purchase.inventory_id%>
      <%= hidden_field_tag :customer_id, session[:customer_id]%>
      <%= hidden_field_tag :purchased_quantity, purchase.purchased_quantity%>
      <%= submit_tag "Place your order"%>
    <% end %>
  <% end %>


  <table>
    <tr>
      <th>Item Name</th>
      <th>Quantity</th>
    </tr>
    <% @customer.find_item.each do |key, value| %>
      <tr>
      <td> <%= key %> </td>
      <td> <%= value%> </td>
      </tr>
    <% end %>
  </table>


  <% @inventories.each do |inventory| %>
  <div class="card" style="width: 18rem;">
    <div class="card-body">
      <h5 class="card-title">Card title</h5>
      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
      <a href="#" class="btn btn-primary">Go somewhere</a>
    </div>
  </div>
  <% end %>
