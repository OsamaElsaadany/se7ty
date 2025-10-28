import 'package:flutter/material.dart';
import 'package:se7ty/core/utils/text_Styles.dart';

class extile extends StatelessWidget {
  const extile({super.key, required this.tit, required this.endtit});
  final String tit;
  final String endtit;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(endtit, style: TextStyle(fontSize: 14, color: Colors.grey)),
          const SizedBox(width: 5),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
      title: Text(tit, ),
      children: [Text('---------------')],
    );
  }
}
