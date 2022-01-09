import 'package:d_brain_test/src/modules/vouchers/controllers/voucher/voucher_controller.dart';
import 'package:flutter/material.dart';

class VoucherItemWidget extends StatefulWidget {
  VoucherController voucherController;
  VoucherItemWidget({Key? key, required this.voucherController}) : super(key: key);

  @override
  _VoucherItemWidgetState createState() => _VoucherItemWidgetState();
}

class _VoucherItemWidgetState extends State<VoucherItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        elevation: 16,
        child: Container(
          height: 50.0,
          margin: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.file_copy),
                  Text(DateTime.now().toString()),
                  const Icon(Icons.check_circle)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
