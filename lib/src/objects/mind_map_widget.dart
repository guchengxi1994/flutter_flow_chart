import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_flow_chart/flutter_flow_chart.dart';

class MindMapItemWidget extends StatelessWidget {
  final FlowElement element;

  const MindMapItemWidget({
    super.key,
    required this.element,
  });

  @override
  Widget build(BuildContext context) {
    Map<String, String> map;

    try {
      map = jsonDecode(element.text);
    } catch (_) {
      map = {"node": element.text, "description": ""};
    }

    return SizedBox(
      width: element.size.width,
      height: element.size.height,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: element.backgroundColor,
          boxShadow: [
            if (element.elevation > 0.01)
              BoxShadow(
                color: Colors.grey,
                offset: Offset(element.elevation, element.elevation),
                blurRadius: element.elevation * 1.3,
              ),
          ],
          border: Border.all(
            color: element.borderColor,
            width: element.borderThickness,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                child: Text(
                  map['node']!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: element.textColor,
                    fontSize: element.textSize,
                    fontWeight: element.textIsBold
                        ? FontWeight.bold
                        : FontWeight.normal,
                    fontFamily: element.fontFamily,
                  ),
                ),
              ),
            ),
            Divider(
              color: element.borderColor,
              thickness: element.borderThickness,
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                  child: Text(
                map['description']!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: element.textColor,
                  fontSize: element.textSize,
                  fontWeight:
                      element.textIsBold ? FontWeight.bold : FontWeight.normal,
                  fontFamily: element.fontFamily,
                ),
              )),
            )
          ],
        ),
      ),

      // ElementTextWidget(element: element),
    );
  }
}
