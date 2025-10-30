# Details

Date : 2025-10-04 16:06:22

Directory c:\\fluuter_pr\\house_of_electricity_store\\lib

Total : 96 files,  3312 codes, 61 comments, 540 blanks, all 3913 lines

[Summary](results.md) / Details / [Diff Summary](diff.md) / [Diff Details](diff-details.md)

## Files
| filename | language | code | comment | blank | total |
| :--- | :--- | ---: | ---: | ---: | ---: |
| [lib/main.dart](/lib/main.dart) | Dart | 29 | 0 | 4 | 33 |
| [lib/src/app\_theme.dart](/lib/src/app_theme.dart) | Dart | 10 | 0 | 2 | 12 |
| [lib/src/core/app/di.dart](/lib/src/core/app/di.dart) | Dart | 175 | 7 | 9 | 191 |
| [lib/src/core/app/initialize\_supabase.dart](/lib/src/core/app/initialize_supabase.dart) | Dart | 10 | 2 | 2 | 14 |
| [lib/src/core/app/routing\_helper.dart](/lib/src/core/app/routing_helper.dart) | Dart | 24 | 0 | 2 | 26 |
| [lib/src/core/app/sort\_products\_helper.dart](/lib/src/core/app/sort_products_helper.dart) | Dart | 34 | 0 | 4 | 38 |
| [lib/src/core/app/supabase\_query\_helper.dart](/lib/src/core/app/supabase_query_helper.dart) | Dart | 0 | 0 | 2 | 2 |
| [lib/src/core/calculate\_pagination.dart](/lib/src/core/calculate_pagination.dart) | Dart | 3 | 0 | 3 | 6 |
| [lib/src/core/calculate\_products\_prices.dart](/lib/src/core/calculate_products_prices.dart) | Dart | 0 | 0 | 2 | 2 |
| [lib/src/core/consts/database\_consts.dart](/lib/src/core/consts/database_consts.dart) | Dart | 13 | 0 | 2 | 15 |
| [lib/src/core/error\_handler/error\_handler.dart](/lib/src/core/error_handler/error_handler.dart) | Dart | 77 | 3 | 16 | 96 |
| [lib/src/core/presentation/app\_colors.dart](/lib/src/core/presentation/app_colors.dart) | Dart | 9 | 0 | 2 | 11 |
| [lib/src/core/presentation/assets\_manager.dart](/lib/src/core/presentation/assets_manager.dart) | Dart | 3 | 0 | 1 | 4 |
| [lib/src/core/presentation/dialogs.dart](/lib/src/core/presentation/dialogs.dart) | Dart | 64 | 0 | 6 | 70 |
| [lib/src/core/presentation/fonts\_manager.dart](/lib/src/core/presentation/fonts_manager.dart) | Dart | 33 | 1 | 6 | 40 |
| [lib/src/core/presentation/screen\_size\_helper.dart](/lib/src/core/presentation/screen_size_helper.dart) | Dart | 9 | 0 | 3 | 12 |
| [lib/src/core/presentation/sizes.dart](/lib/src/core/presentation/sizes.dart) | Dart | 27 | 0 | 3 | 30 |
| [lib/src/core/presentation/supabase\_image\_helper.dart](/lib/src/core/presentation/supabase_image_helper.dart) | Dart | 26 | 0 | 9 | 35 |
| [lib/src/features/auth/data/repo/supabase\_auth\_repo.dart](/lib/src/features/auth/data/repo/supabase_auth_repo.dart) | Dart | 18 | 0 | 5 | 23 |
| [lib/src/features/auth/domain/repo/auth\_repo.dart](/lib/src/features/auth/domain/repo/auth_repo.dart) | Dart | 4 | 0 | 1 | 5 |
| [lib/src/features/cart\_items/data/models/cart\_product\_model.dart](/lib/src/features/cart_items/data/models/cart_product_model.dart) | Dart | 30 | 0 | 5 | 35 |
| [lib/src/features/cart\_items/data/repositories/cart\_items\_repository.dart](/lib/src/features/cart_items/data/repositories/cart_items_repository.dart) | Dart | 99 | 0 | 18 | 117 |
| [lib/src/features/cart\_items/domain/entities/cart\_product.dart](/lib/src/features/cart_items/domain/entities/cart_product.dart) | Dart | 12 | 0 | 4 | 16 |
| [lib/src/features/cart\_items/domain/repositories/cart\_items\_repository.dart](/lib/src/features/cart_items/domain/repositories/cart_items_repository.dart) | Dart | 11 | 0 | 2 | 13 |
| [lib/src/features/cart\_items/domain/use\_cases/add\_to\_cart.dart](/lib/src/features/cart_items/domain/use_cases/add_to_cart.dart) | Dart | 9 | 0 | 4 | 13 |
| [lib/src/features/cart\_items/domain/use\_cases/clear\_cart\_use\_case.dart](/lib/src/features/cart_items/domain/use_cases/clear_cart_use_case.dart) | Dart | 8 | 0 | 4 | 12 |
| [lib/src/features/cart\_items/domain/use\_cases/fetch\_cart\_items\_ids.dart](/lib/src/features/cart_items/domain/use_cases/fetch_cart_items_ids.dart) | Dart | 8 | 0 | 4 | 12 |
| [lib/src/features/cart\_items/domain/use\_cases/get\_cart\_items.dart](/lib/src/features/cart_items/domain/use_cases/get_cart_items.dart) | Dart | 9 | 0 | 4 | 13 |
| [lib/src/features/cart\_items/domain/use\_cases/get\_cart\_items\_ids.dart](/lib/src/features/cart_items/domain/use_cases/get_cart_items_ids.dart) | Dart | 8 | 0 | 4 | 12 |
| [lib/src/features/cart\_items/domain/use\_cases/remove\_from\_cart.dart](/lib/src/features/cart_items/domain/use_cases/remove_from_cart.dart) | Dart | 8 | 0 | 4 | 12 |
| [lib/src/features/cart\_items/domain/use\_cases/update\_cart\_quantity.dart](/lib/src/features/cart_items/domain/use_cases/update_cart_quantity.dart) | Dart | 8 | 0 | 4 | 12 |
| [lib/src/features/cart\_items/presentation/cubit/cart\_items\_cubit.dart](/lib/src/features/cart_items/presentation/cubit/cart_items_cubit.dart) | Dart | 87 | 0 | 14 | 101 |
| [lib/src/features/cart\_items/presentation/cubit/cart\_items\_state.dart](/lib/src/features/cart_items/presentation/cubit/cart_items_state.dart) | Dart | 14 | 0 | 9 | 23 |
| [lib/src/features/cart\_items/presentation/cubit/cubit/cart\_items\_operations\_cubit.dart](/lib/src/features/cart_items/presentation/cubit/cubit/cart_items_operations_cubit.dart) | Dart | 35 | 0 | 7 | 42 |
| [lib/src/features/cart\_items/presentation/cubit/cubit/cart\_items\_operations\_state.dart](/lib/src/features/cart_items/presentation/cubit/cubit/cart_items_operations_state.dart) | Dart | 8 | 0 | 5 | 13 |
| [lib/src/features/cart\_items/presentation/pages/cart\_items\_page.dart](/lib/src/features/cart_items/presentation/pages/cart_items_page.dart) | Dart | 21 | 0 | 3 | 24 |
| [lib/src/features/cart\_items/presentation/widgets/add\_to\_cart\_button.dart](/lib/src/features/cart_items/presentation/widgets/add_to_cart_button.dart) | Dart | 60 | 0 | 8 | 68 |
| [lib/src/features/cart\_items/presentation/widgets/cart\_item\_box.dart](/lib/src/features/cart_items/presentation/widgets/cart_item_box.dart) | Dart | 129 | 3 | 15 | 147 |
| [lib/src/features/cart\_items/presentation/widgets/cart\_items\_list.dart](/lib/src/features/cart_items/presentation/widgets/cart_items_list.dart) | Dart | 76 | 0 | 10 | 86 |
| [lib/src/features/cart\_items/presentation/widgets/cart\_items\_operations\_listener.dart](/lib/src/features/cart_items/presentation/widgets/cart_items_operations_listener.dart) | Dart | 18 | 0 | 3 | 21 |
| [lib/src/features/cart\_items/presentation/widgets/order\_products.dart](/lib/src/features/cart_items/presentation/widgets/order_products.dart) | Dart | 17 | 0 | 3 | 20 |
| [lib/src/features/cart\_items/presentation/widgets/total\_price.dart](/lib/src/features/cart_items/presentation/widgets/total_price.dart) | Dart | 35 | 0 | 3 | 38 |
| [lib/src/features/category/data/models/category\_model.dart](/lib/src/features/category/data/models/category_model.dart) | Dart | 27 | 0 | 4 | 31 |
| [lib/src/features/category/data/repositories/supabase\_categories\_repository.dart](/lib/src/features/category/data/repositories/supabase_categories_repository.dart) | Dart | 38 | 0 | 7 | 45 |
| [lib/src/features/category/domain/entities/category.dart](/lib/src/features/category/domain/entities/category.dart) | Dart | 16 | 0 | 2 | 18 |
| [lib/src/features/category/domain/repositories/categories\_repository.dart](/lib/src/features/category/domain/repositories/categories_repository.dart) | Dart | 6 | 0 | 2 | 8 |
| [lib/src/features/category/domain/use\_cases/get\_all\_categories\_usecase.dart](/lib/src/features/category/domain/use_cases/get_all_categories_usecase.dart) | Dart | 9 | 0 | 4 | 13 |
| [lib/src/features/category/domain/use\_cases/get\_subcategories\_usecase.dart](/lib/src/features/category/domain/use_cases/get_subcategories_usecase.dart) | Dart | 9 | 0 | 4 | 13 |
| [lib/src/features/category/presentation/cubit/categories\_list/categories\_list\_cubit.dart](/lib/src/features/category/presentation/cubit/categories_list/categories_list_cubit.dart) | Dart | 25 | 0 | 5 | 30 |
| [lib/src/features/category/presentation/cubit/categories\_list/categories\_list\_state.dart](/lib/src/features/category/presentation/cubit/categories_list/categories_list_state.dart) | Dart | 16 | 0 | 8 | 24 |
| [lib/src/features/category/presentation/pages/categories\_page.dart](/lib/src/features/category/presentation/pages/categories_page.dart) | Dart | 16 | 0 | 3 | 19 |
| [lib/src/features/category/presentation/widgets/categories\_lists.dart](/lib/src/features/category/presentation/widgets/categories_lists.dart) | Dart | 82 | 0 | 12 | 94 |
| [lib/src/features/category/presentation/widgets/category\_box.dart](/lib/src/features/category/presentation/widgets/category_box.dart) | Dart | 63 | 0 | 6 | 69 |
| [lib/src/features/category/presentation/widgets/category\_tile.dart](/lib/src/features/category/presentation/widgets/category_tile.dart) | Dart | 80 | 0 | 10 | 90 |
| [lib/src/features/favorites/data/repositories/supabase\_favorites\_repo.dart](/lib/src/features/favorites/data/repositories/supabase_favorites_repo.dart) | Dart | 71 | 0 | 10 | 81 |
| [lib/src/features/favorites/domain/repositories/favorites\_repository.dart](/lib/src/features/favorites/domain/repositories/favorites_repository.dart) | Dart | 8 | 0 | 2 | 10 |
| [lib/src/features/favorites/domain/use\_cases/add\_to\_favorites\_use\_case.dart](/lib/src/features/favorites/domain/use_cases/add_to_favorites_use_case.dart) | Dart | 9 | 0 | 2 | 11 |
| [lib/src/features/favorites/domain/use\_cases/fetch\_favorite\_product\_ids\_use\_case.dart](/lib/src/features/favorites/domain/use_cases/fetch_favorite_product_ids_use_case.dart) | Dart | 8 | 0 | 3 | 11 |
| [lib/src/features/favorites/domain/use\_cases/get\_favorite\_product\_ids\_use\_case.dart](/lib/src/features/favorites/domain/use_cases/get_favorite_product_ids_use_case.dart) | Dart | 8 | 0 | 2 | 10 |
| [lib/src/features/favorites/domain/use\_cases/get\_favorites\_use\_case.dart](/lib/src/features/favorites/domain/use_cases/get_favorites_use_case.dart) | Dart | 9 | 0 | 3 | 12 |
| [lib/src/features/favorites/domain/use\_cases/remove\_from\_favorites\_use\_case.dart](/lib/src/features/favorites/domain/use_cases/remove_from_favorites_use_case.dart) | Dart | 8 | 0 | 3 | 11 |
| [lib/src/features/favorites/presentation/cubit/favorites\_list/favorites\_cubit.dart](/lib/src/features/favorites/presentation/cubit/favorites_list/favorites_cubit.dart) | Dart | 18 | 0 | 5 | 23 |
| [lib/src/features/favorites/presentation/cubit/favorites\_list/favorites\_state.dart](/lib/src/features/favorites/presentation/cubit/favorites_list/favorites_state.dart) | Dart | 13 | 0 | 8 | 21 |
| [lib/src/features/favorites/presentation/cubit/favorites\_operations/favorites\_operations\_cubit.dart](/lib/src/features/favorites/presentation/cubit/favorites_operations/favorites_operations_cubit.dart) | Dart | 38 | 0 | 7 | 45 |
| [lib/src/features/favorites/presentation/cubit/favorites\_operations/favorites\_operations\_state.dart](/lib/src/features/favorites/presentation/cubit/favorites_operations/favorites_operations_state.dart) | Dart | 13 | 0 | 8 | 21 |
| [lib/src/features/favorites/presentation/pages/favorite\_items\_page.dart](/lib/src/features/favorites/presentation/pages/favorite_items_page.dart) | Dart | 37 | 0 | 5 | 42 |
| [lib/src/features/favorites/presentation/widgets/add\_to\_favorites\_button.dart](/lib/src/features/favorites/presentation/widgets/add_to_favorites_button.dart) | Dart | 49 | 0 | 11 | 60 |
| [lib/src/features/favorites/presentation/widgets/favorite\_product\_box.dart](/lib/src/features/favorites/presentation/widgets/favorite_product_box.dart) | Dart | 68 | 1 | 8 | 77 |
| [lib/src/features/favorites/presentation/widgets/show\_favorites\_button.dart](/lib/src/features/favorites/presentation/widgets/show_favorites_button.dart) | Dart | 0 | 30 | 2 | 32 |
| [lib/src/features/home/home\_widgets.dart](/lib/src/features/home/home_widgets.dart) | Dart | 73 | 0 | 10 | 83 |
| [lib/src/features/initialization/domain/initi\_use\_case.dart](/lib/src/features/initialization/domain/initi_use_case.dart) | Dart | 8 | 0 | 4 | 12 |
| [lib/src/features/initialization/initializer.dart](/lib/src/features/initialization/initializer.dart) | Dart | 27 | 5 | 5 | 37 |
| [lib/src/features/initialization/presentation/cubit/initializer\_cubit.dart](/lib/src/features/initialization/presentation/cubit/initializer_cubit.dart) | Dart | 16 | 0 | 3 | 19 |
| [lib/src/features/initialization/presentation/cubit/initializer\_state.dart](/lib/src/features/initialization/presentation/cubit/initializer_state.dart) | Dart | 9 | 0 | 6 | 15 |
| [lib/src/features/initialization/presentation/initial\_screen.dart](/lib/src/features/initialization/presentation/initial_screen.dart) | Dart | 60 | 0 | 5 | 65 |
| [lib/src/features/product/data/models/product\_model.dart](/lib/src/features/product/data/models/product_model.dart) | Dart | 52 | 0 | 4 | 56 |
| [lib/src/features/product/data/repositories/supabase/products\_repository.dart](/lib/src/features/product/data/repositories/supabase/products_repository.dart) | Dart | 55 | 2 | 6 | 63 |
| [lib/src/features/product/domain/entities/product.dart](/lib/src/features/product/domain/entities/product.dart) | Dart | 98 | 0 | 3 | 101 |
| [lib/src/features/product/domain/repositories/product\_repository.dart](/lib/src/features/product/domain/repositories/product_repository.dart) | Dart | 6 | 0 | 2 | 8 |
| [lib/src/features/product/domain/use\_cases/get\_home\_page\_products\_usecase.dart](/lib/src/features/product/domain/use_cases/get_home_page_products_usecase.dart) | Dart | 9 | 0 | 4 | 13 |
| [lib/src/features/product/domain/use\_cases/query\_by\_category\_usecase.dart](/lib/src/features/product/domain/use_cases/query_by_category_usecase.dart) | Dart | 18 | 0 | 4 | 22 |
| [lib/src/features/product/domain/use\_cases/query\_by\_name\_usecase.dart](/lib/src/features/product/domain/use_cases/query_by_name_usecase.dart) | Dart | 9 | 3 | 4 | 16 |
| [lib/src/features/product/presentation/cubit/products\_list/products\_list\_cubit.dart](/lib/src/features/product/presentation/cubit/products_list/products_list_cubit.dart) | Dart | 39 | 0 | 8 | 47 |
| [lib/src/features/product/presentation/cubit/products\_list/products\_list\_state.dart](/lib/src/features/product/presentation/cubit/products_list/products_list_state.dart) | Dart | 16 | 0 | 8 | 24 |
| [lib/src/features/product/presentation/pages/home\_page.dart](/lib/src/features/product/presentation/pages/home_page.dart) | Dart | 39 | 1 | 4 | 44 |
| [lib/src/features/product/presentation/pages/product\_details.dart](/lib/src/features/product/presentation/pages/product_details.dart) | Dart | 62 | 2 | 8 | 72 |
| [lib/src/features/product/presentation/widgets/product\_box.dart](/lib/src/features/product/presentation/widgets/product_box.dart) | Dart | 46 | 0 | 3 | 49 |
| [lib/src/features/product/presentation/widgets/product\_boxes\_resources.dart](/lib/src/features/product/presentation/widgets/product_boxes_resources.dart) | Dart | 81 | 0 | 8 | 89 |
| [lib/src/features/product/presentation/widgets/products\_list.dart](/lib/src/features/product/presentation/widgets/products_list.dart) | Dart | 101 | 0 | 17 | 118 |
| [lib/src/features/product/presentation/widgets/share\_product.dart](/lib/src/features/product/presentation/widgets/share_product.dart) | Dart | 8 | 0 | 3 | 11 |
| [lib/src/features/search/presentation/cubit/query\_products\_cubit.dart](/lib/src/features/search/presentation/cubit/query_products_cubit.dart) | Dart | 48 | 0 | 8 | 56 |
| [lib/src/features/search/presentation/cubit/query\_products\_state.dart](/lib/src/features/search/presentation/cubit/query_products_state.dart) | Dart | 14 | 0 | 9 | 23 |
| [lib/src/features/search/presentation/pages/searched\_products\_page.dart](/lib/src/features/search/presentation/pages/searched_products_page.dart) | Dart | 148 | 0 | 18 | 166 |
| [lib/src/features/search/presentation/widgets/search\_product\_field.dart](/lib/src/features/search/presentation/widgets/search_product_field.dart) | Dart | 77 | 0 | 11 | 88 |
| [lib/src/features/search/presentation/widgets/sort\_products\_dialog.dart](/lib/src/features/search/presentation/widgets/sort_products_dialog.dart) | Dart | 52 | 0 | 4 | 56 |
| [lib/src/routing.dart](/lib/src/routing.dart) | Dart | 119 | 1 | 4 | 124 |

[Summary](results.md) / Details / [Diff Summary](diff.md) / [Diff Details](diff-details.md)