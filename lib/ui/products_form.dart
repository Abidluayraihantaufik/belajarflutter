import 'package:belajarflutter/ui/products_detail.dart';
import 'package:flutter/material.dart';

class ProductsForm extends StatefulWidget {
  const ProductsForm({Key? key}) : super(key: key);

  @override
  _ProductsFormState createState() => _ProductsFormState();

}

class _ProductsFormState extends State<ProductsForm> {
  final _kodeProdukTextBoxController = TextEditingController();
  final _namaProdukTextBoxController = TextEditingController();
  final _hargaProdukTextBoxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Produk')
        ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _textBoxKodeProduk(),
            _textBoxNamaProduk(),
            _textBoxHargaProduk(),
            _tombolSimpan()
          ],
        ),
      ),
    );
  }

  _textBoxKodeProduk() {
    return TextField(
      decoration: const InputDecoration(labelText: 'Kode Produk'),
      controller: _kodeProdukTextBoxController,
    );
  }

  _textBoxNamaProduk() {
    return TextField(
      decoration: const InputDecoration(labelText: 'Nama Produk'),
      controller: _namaProdukTextBoxController,
    );
  }

  _textBoxHargaProduk() {
    return TextField(
      decoration: const InputDecoration(labelText: 'Hargra Produk'),
      controller: _hargaProdukTextBoxController,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(onPressed: () {
      String kodeProduk = _kodeProdukTextBoxController.text;
      String namaProduk = _namaProdukTextBoxController.text;
      int harga = int.parse(
        _hargaProdukTextBoxController.text
      );
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductsDetail(
            kodeProduk: kodeProduk,
            namaProduk: namaProduk,
            harga: harga,
          )));
    }, child: const Text('Simpan'));
  }
}