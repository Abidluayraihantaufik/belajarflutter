import 'package:belajarflutter/bloc/logout_bloc.dart';
import 'package:belajarflutter/bloc/produk_bloc.dart';
import 'package:belajarflutter/ui/login_page.dart';
import 'package:belajarflutter/ui/products_detail.dart';
import 'package:belajarflutter/ui/products_form.dart';
import 'package:belajarflutter/model/produk.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Produk'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              //   Menampilkan ikon +
              child: const Icon(Icons.add, size: 26.0,),
              onTap: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProductsForm()
                    )
                );
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Logout'),
              trailing: const Icon(Icons.logout),
              onTap: () async {
                await LogoutBloc.logout().then((value) => {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage())
                  )
                });
              },
            )
          ],
        ),
      ),
      body: FutureBuilder<List>(
        future: ProdukBloc.getProduks(),
        builder: (context, snapshot) {
          if(snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListProduk(list: snapshot.data)
              : const Center(child: CircularProgressIndicator());
        },
      )
    );
  }
}

class ListProduk extends StatelessWidget {
  final List? list;

  const ListProduk({super.key, this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list!.length,
      itemBuilder: (context, i) {
        return ProductsItem(produk: list![i]);
      },
    );
  }
}

class ProductsItem extends StatelessWidget {
  final Produk produk;

  const ProductsItem({super.key, required this.produk});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(produk.namaProduk!),
          subtitle: Text(produk.hargaProduk.toString()),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductsDetail(
                produk: produk,
              )
          )
        );
      },
    );
  }
}