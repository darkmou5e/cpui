import 'package:flutter/material.dart';

abstract class GridLayoutChild {
  GridLayoutChild({@required this.size});
  final int size;
}

class GridLayoutSpan extends GridLayoutChild {
  GridLayoutSpan({size}) : super(size: size);
}

class GridLayoutItem extends GridLayoutChild {
  GridLayoutItem({@required this.child, size}) : super(size: size);
  final Widget child;
}

class GridLayout extends StatelessWidget {
  GridLayout(
      {this.width, this.columns, this.gutter, this.margin, this.children});

  final double width, margin, gutter;
  final int columns;
  final List<GridLayoutChild> children;

  double get _columnWidth =>
      (width - margin * 2 - gutter * (columns - 1)) / columns;

  List<Widget> get _items => children
      .asMap()
      .entries
      .map((entrie) => Container(
            width: _columnWidth * entrie.value.size +
                gutter * (entrie.value.size - 1),
            margin: EdgeInsets.only(left: entrie.key == 0 ? 0 : gutter),
            child: entrie.value is GridLayoutItem
                ? (entrie.value as GridLayoutItem).child
                : null,
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        padding: EdgeInsets.symmetric(horizontal: margin.toDouble()),
        child: Row(children: _items));
  }
}
