import 'package:belajarflutter/bloc/produk_bloc.dart';
import 'package:belajarflutter/model/produk.dart';
import 'package:belajarflutter/ui/products_page.dart';
import 'package:belajarflutter/widget/warning_dialog.dart';
import 'package:flutter/material.dart';

class ProductsForm extends StatefulWidget {
  final Produk? produk;

  const ProductsForm({super.key, this.produk});

  @override
  _ProductsFormState createState() => _ProductsFormState();

}

class _ProductsFormState extends State<ProductsForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String judul = "Tambah Produk";
  String tombolSubmit = 'Simpan';

  final _kodeProdukTextBoxController = TextEditingController();
  final _namaProdukTextBoxController = TextEditingController();
  final _hargaProdukTextBoxController = TextEditingController();

  // @override
  void iniState() {
    super.initState();
    isUpdate();
  }

  isUpdate() {
    if(widget.produk != null) {
      setState(() {
        judul = 'Ubah Produk';
        tombolSubmit = 'Ubah';

        _kodeProdukTextBoxController.text = widget.produk!.kodeProduk!;
        _namaProdukTextBoxController.text = widget.produk!.namaProduk!;
        _hargaProdukTextBoxController.text = widget.produk!.hargaProduk!.toString();
      });
    } else {
      judul = 'Tambah Produk';
      tombolSubmit = 'Simpan';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(judul)
        ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _kodeProdukTextField(),
                _namaProdukTextField(),
                _hargaProdukTextField(),
                _buttonSubmit()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _kodeProdukTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Kode Produk'),
      keyboardType: TextInputType.text,
      controller: _kodeProdukTextBoxController,
      validator: (value) {
        if(value!.isEmpty) {
          return 'Kode produk harus diisi';
        }
        return null;
      },
    );
  }

  Widget _namaProdukTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Nama Produk'),
      keyboardType: TextInputType.text,
      controller: _namaProdukTextBoxController,
      validator: (value) {
        if(value!.isEmpty) {
          return 'Nama produk harus diisi';
        }
        return null;
      },
    );
  }

  Widget _hargaProdukTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Harga'),
      keyboardType: TextInputType.number,
      controller: _hargaProdukTextBoxController,
      validator: (value) {
        if(value!.isEmpty) {
          return 'Harga harus diisi';
        }
        return null;
      },
    );
  }

  Widget _buttonSubmit() {
    return ElevatedButton(
        onPressed: () {
          var validate = _formKey.currentState!.validate();
          if(validate) {
            if(!_isLoading) {
              if(widget.produk != null) {
                ubah();
              } else {
                simpan();
              }
            }
          }
        },
        child: Text(tombolSubmit)
    );
  }

  simpan() {
    setState(() {
      _isLoading = true;
    });
    Produk createProduk = Produk(id: null);
    createProduk.kodeProduk = _kodeProdukTextBoxController.text;
    createProduk.namaProduk = _namaProdukTextBoxController.text;
    createProduk.hargaProduk = int.parse(_hargaProdukTextBoxController.text);

    ProdukBloc.addProduk(produk: createProduk).then((value) => {
      Navigator
          .of(context)
          .push(MaterialPageRoute(builder: (BuildContext context) => const ProductsPage()))
    }, onError: (error) {
      showDialog(
          context: context,
          builder: (BuildContext context) => const WarningDialog(
            description: "Gagal menyimpan, silahkan coba lagi",
          )
      );
    });
    setState(() {
      _isLoading = false;
    });
  }

  ubah() {
    setState(() {
      _isLoading = true;
    });
    Produk updateProduk = Produk(id: null);
    updateProduk.kodeProduk = _kodeProdukTextBoxController.text;
    updateProduk.namaProduk = _namaProdukTextBoxController.text;
    updateProduk.hargaProduk = int.parse(_hargaProdukTextBoxController.text);

    ProdukBloc.updateProduk(produk: updateProduk).then((value) => {
      Navigator
          .of(context)
          .push(MaterialPageRoute(builder: (BuildContext context) => const ProductsPage()))
    }, onError: (error) {
      showDialog(
          context: context,
          builder: (BuildContext context) => const WarningDialog(
            description: "Gagal mengubah, silahkan coba lagi",
          )
      );
    });
    setState(() {
      _isLoading = false;
    });
  }
}