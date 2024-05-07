import 'package:flutter/material.dart';

class ProductsDetail extends StatefulWidget {
  final String? kodeProduk;
  final String? namaProduk;
  final int? harga;

  const ProductsDetail({Key? key, this.kodeProduk, this.namaProduk, this.harga}) : super(key: key);

  @override
  _ProductsDetailState createState() => _ProductsDetailState();
}

class _ProductsDetailState extends State<ProductsDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
      ),
      body: Column(
        children: [
          Text('Kode Produk: ' + widget.kodeProduk.toString()),
          Text('Nama Produk: ${widget.namaProduk}'),
          Text('Harga: ${widget.harga}')
        ],
      )
    );
  }
}