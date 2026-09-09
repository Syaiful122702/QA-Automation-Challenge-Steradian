Feature : dashboard dan cart flow 

#positive case
Scenario : User berhasil masuk dashboard products dan melakukan transaksi
    Given berada di halaman login swag labs
    When memasukan kolom username dengan data "standard_user" dan kolom password dengan data "secret_sauce"
    And melakukan klik pada tombol login
    Then berhasil masuk ke dashboard
    When melakukan klik pada tombol "add to cart" pada product dengan judul "sauce lab backpacks"
    Then products berhasil masuk ke dalam halaman your carts
    And klik icon tombol cart
    Then berpindah ke halaman "Your Cart"
    When klik tombol Checkout
    Then berpindah ke halaman "Checkout: Your Information"
    When memasukan data pada kolom First name "kriegs", kolom last name dengan data "nihil", dan kolom Postal code dengan data "16562"
    And melakukan klik pada tombol continue
    And klik tombol finish
    Then Berpindah ke halaman "Checkout: Complete!"
    And klik tombol Generate PDF order
    Then Data order PDF berhasil dibuat dan terdownload pada browser
    And klik tombol back home
    Then berhasil kembali ke halaman dashboard products

#negative case
Scenario : user berhasil masuk dashboard dan memilih product tetapi tidak bisa mengisi kolom last name pada halaman "Checkout:your Information"
    Given berada dihalaman login swag labs
    When memasukan kolom username dengan data "error_user" dan kolom password dengan data "secret_sauce"
    And Melakukan aksi klik pada tombol login
    Then berhasil masuk ke dashboard product
    And Klik tombol add to cart 
    When Klik tombol icon your cart
    Then berpindah ke halaman "Your Cart"
    And klik tombol Checkout
    Then berpindah ke halaman "Checkout: Your Information"
    And melakukan isi kolom lastname dengan data "kriegs" dan postal code "16562"
    But melakukan isi pada kolom lastname data akan terhapus dengan sendirinya dan tidak dapat di inputkan data
    Then tidak bisa melanjutkan ke halaman pembayaran

Scenario : user berhasil masuk dan memilih filter yang di inginkan tetapi muncul error_user
    Given berada dihalaman login swag labs
    When memasukan kolom username dengan data "error_user" dan kolom password dengan data "secret_sauce"
    And Melakukan aksi klik pada tombol login
    Then berhasil masuk ke dashboard product
    When Klik kolom filter 
    And memilih opsi "price (low to high)"
    Then muncul error "Sorting is broken! This error has been reported to Backtrace."

#Edge case
Scenario : user berhasil masuk tetapi mengalami loading atau lag pada halaman dan melakukan hapus products pada cart
    Given berada dihalaman login swag labs
    When memasukan kolom username dengan data "performance_glitch_user" dan kolom password dengan data "secret_sauce"
    And Melakukan aksi klik pada tombol login
    And Menunggu selama 5.18 detik
    Then berhasil berpindah ke halaman dashboard products
    When melakukan klik pada tombol add to cart di product "sauce labs bike light"
    And klik tombol icon "Your cart"
    When melakukan klik pada tombol remove dihalaman "your cart"
    And klik tombol "continue shopping"
    And menunggu selama 5.18 detik
    Then berhasil berpindah ke halaman dashboard products

Scenario : user tidak Memilih product tapi masih bisa melakukan pembayaran
    Given berada di halaman login swag labs
    When memasukan kolom username dengan data "standard_user" dan kolom password dengan data "secret_sauce"
    And melakukan klik pada tombol login
    Then berhasil masuk ke dashboard
    And Langsung klik tombol icon your cart tanpa memilih product
    And Halaman your cart tidak terisi data product
    When Klik tombol checkout
    Then berpindah ke halaman "Checkout: Your Information"
    When mengisi kolom First name dengan data "kriegs" dan kolom last name dengan data "nihil", dan kolom Postal code dengan data "16562"
    And Klik tombol continue
    Then berpindah ke halaman "Checkout: Overview" dengan data product yang kosong
    And Klik tombol finish
    Then berpindah ke halaman "Checkout: Complete!"

