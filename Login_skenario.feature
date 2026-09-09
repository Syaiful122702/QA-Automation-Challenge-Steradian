Feature : user login flow

#positive case
Scenario : user berhasil login dengan akun yang valid
    Given berada di halaman login Swag labs
    When Menginputkan kolom username dengan data "standard_user" dan kolom password dengan data "secret_sauce"
    And melakukan klik pada tombol login
    Then berpindah ke halaman utama dashboard products 

#negative case
Scenario : user gagal melakukan login dengan akun yang valid
    Given berada di halaman login Swag labs
    When menginputkan kolom username dengan data "locked_out_user" dan kolom password dengan data "secret_sauce"
    And melakukan klik pada tombol login
    Then muncul error "Epic sadface: Sorry, this user has been locked out."

Scenario : validasi halaman login ketika menggunakan password lain selain password yang valid
    Given berada di halaman login Swag labs
    When menginputkan kolom username dengan data "standard_user" dan kolom password dengan data "Ada123"
    And melakukan klik pada tombol login
    Then muncul error "Epic sadface: Username and password do not match any user in this service"

Scenario : validasi halaman login ketika mengosongkan kolom password
    Given berada di halaman login swag labs
    When menginput kolom username dengan data "standard_user" dan tidak mengisi kolom password
    And melakukan klik pada tombol login
    Then muncul error "Epic sadface: Password is required"

Scenario : validasi halaman login ketika mengosongkan kolom username
    Given berada di halaman login swag labs
    When tidak mengisi kolom username dan menginput kolom password dengan data "secret_sauce"
    And melakukan klik pada tombol login
    Then muncul error "Epic sadface: Username is required"

#Edge case
Scenario : validasi halaman ketika melakukan pindah halaman secara paksa dan sedang berada di halaman login
    Given berada di halaman login swag labs 
    And tidak mengisi kolom username dan password
    When mengklik tombol "Click to go back, hold to see history" pada browser
    Then pada halaman login muncul error "Epic sadface: You can only access '/checkout-complete.html' when you are logged in." 

| username        | password     |  Aksi                                                            | Hasil                                                                                             |
| standard_user   | secret_sauce | Klik tombol login                                                | berhasil berpindah ke halaman utama dashboard products                                            |
| locked_out_user | secret_sauce | Klik tombol login                                                | muncul error "Epic sadface: Sorry, this user has been locked out."                                |
| -               | -            | Klik tombol "Click to go back, hold to see history" pada browser | muncul error "Epic sadface: You can only access '/checkout-complete.html' when you are logged in."|