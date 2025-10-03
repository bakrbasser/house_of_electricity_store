enum Tables { products, cartItems, favorites, categories }

String tableName(Tables table) {
  switch (table) {
    case Tables.products:
      return 'Products';
    case Tables.cartItems:
      return 'Cart_items';
    case Tables.favorites:
      return 'Favorites';
    case Tables.categories:
      return 'Categories';
  }
}
