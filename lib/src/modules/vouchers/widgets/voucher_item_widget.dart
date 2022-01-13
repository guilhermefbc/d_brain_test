import 'package:d_brain_test/src/modules/vouchers/controllers/voucher/voucher_controller.dart';
import 'package:d_brain_test/src/shared/util/date_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class VoucherItemWidget extends StatefulWidget {
  VoucherController voucherController;
  VoucherItemWidget({Key? key, required this.voucherController}) : super(key: key);

  @override
  _VoucherItemWidgetState createState() => _VoucherItemWidgetState();
}

class _VoucherItemWidgetState extends State<VoucherItemWidget> {
  Widget _getVoucherStatusIcon(VoucherStatus status) {
    IconData icon;
    Color color;

    switch(status) {
      case VoucherStatus.pendent: {
        icon = Icons.access_time;
        color = const Color(0xFFFFC048);
        break;
      }
      case VoucherStatus.uploaded: {
        icon = Icons.check_circle;
        color = const Color(0xFF52E2C7);
        break;
      }
      case VoucherStatus.failed: {
        icon = Icons.error_outline;
        color = const Color(0xFFFF6464);
        break;
      }
      case VoucherStatus.loading: {
        return const CircularProgressIndicator();
      }
    }

    return Icon(icon,color: color,);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: GestureDetector(
        onTap: () {},
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          elevation: 16,
          child: Container(
            height: 62.25,
            margin: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.file_copy),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name: " + widget.voucherController.name),
                        Text("Date: " + DateUtil.formatDate(widget.voucherController.date)),
                      ],
                    ),
                    Observer(builder: (_) => _getVoucherStatusIcon(widget.voucherController.status))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
