import 'package:flutter/material.dart';
import 'package:belajarflutter/model/produk.dart';
import 'package:belajarflutter/ui/products_form.dart';

class ProductsDetail extends StatefulWidget {
  final Produk? produk;

  const ProductsDetail({super.key, this.produk});

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
      body: Center(
        child: Column(
          children: [
            Text(
              "Kode Produk: ${widget.produk!.kodeProduk}",
              style: const TextStyle(fontSize: 20.0),
            ),
            Text(
              "Nama Produk: ${widget.produk!.namaProduk}",
              style: const TextStyle(fontSize: 18.0),
            ),
            Text(
              "Harga Produk: Rp. ${widget.produk!.hargaProduk.toString()}",
              style: const TextStyle(fontSize: 18.0),
            ),
            _tombolHapusEdit()
          ],
        )
      )
    );
  }

  Widget _tombolHapusEdit() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        OutlinedButton(
            child: const Text('Edit'),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductsForm(produk: widget.produk!,)
                  )
              );
            },
        ),
        OutlinedButton(
            onPressed: () => confirmHapus(),
            child: const Text('Hapus')
        )
      ],
    );
  }

  void confirmHapus() {
    AlertDialog alertDialog = AlertDialog(
      content: const Text('Yakin menghapus data ini?'),
      actions: [
        OutlinedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductsForm(produk: widget.produk!))
              );
            },
            child: const Text('Ya')
        ),
        OutlinedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tidak')
        )
      ],
    );

    showDialog(context: context, builder: (context) => alertDialog);
  }

}