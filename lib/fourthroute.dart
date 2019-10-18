import 'package:flutter/material.dart';
import 'package:testone/deals.dart';
import 'package:testone/favorites.dart';
import 'package:testone/homelandingpage.dart';
import 'package:testone/profile.dart';
import 'layout_type.dart';

class FourthRoute extends StatefulWidget{
  FourthRoute({Key key}): super(key:key);

  @override
  _FourthRouteState createState() => _FourthRouteState();

}
class _FourthRouteState extends State<FourthRoute>{
  LayoutGroup _layoutGroup=LayoutGroup.scrollable;
  LayoutType _layoutSelection = LayoutType.homepage;

  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
      );
  }
  
  void _onLayoutGroupToggle() {
    setState(() {
      _layoutGroup = _layoutGroup == LayoutGroup.nonScrollable
          ? LayoutGroup.scrollable
          : LayoutGroup.nonScrollable;
    });
  }


Widget _buildBody() {
    return <LayoutType, WidgetBuilder>{
      LayoutType.homepage: (_) => HomeLandingPage(
          layoutGroup: _layoutGroup, onLayoutToggle: _onLayoutGroupToggle),
      LayoutType.deals: (_) => Deals(
          layoutGroup: _layoutGroup, onLayoutToggle: _onLayoutGroupToggle),
      LayoutType.favourites: (_) => Favourites(
          layoutGroup: _layoutGroup, onLayoutToggle: _onLayoutGroupToggle),
      LayoutType.profile: (_) => Profile(
          layoutGroup: _layoutGroup, onLayoutToggle: _onLayoutGroupToggle),
      
    }[_layoutSelection](context);
  }

void _onLayoutSelected(LayoutType selection) {
    setState(() {
      if (_layoutGroup == LayoutGroup.nonScrollable) {
        _layoutSelection = selection;
      } else {
        _layoutSelection = selection;
      }
    });
  }


void _onSelectTab(int index) {
    if (_layoutGroup == LayoutGroup.nonScrollable) {
      _onLayoutSelected(LayoutType.values[index]);
    } else {
      _onLayoutSelected(LayoutType.values[index + 5]);
    }
  }

  Color _colorTabMatching({LayoutType layoutSelection}) {
    if (_layoutGroup == LayoutGroup.nonScrollable) {
      return _layoutSelection == layoutSelection ? Colors.orange : Colors.grey;
    } else {
      return _layoutSelection == layoutSelection ? Colors.orange : Colors.grey;
    }
  }


BottomNavigationBarItem _buildItem(
      {IconData icon, LayoutType layoutSelection}) {
    String text = layoutNames[layoutSelection];
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _colorTabMatching(layoutSelection: layoutSelection),
      ),
      title: Text(
        text,
        style: TextStyle(
          color: _colorTabMatching(layoutSelection: layoutSelection),
        ),
      ),
    );
  }


Widget _buildBottomNavigationBar() {
      return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          _buildItem(icon: Icons.home, layoutSelection: LayoutType.homepage),
          _buildItem(icon: Icons.business_center, layoutSelection: LayoutType.deals),
          _buildItem(icon: Icons.favorite_border, layoutSelection: LayoutType.favourites),
          _buildItem(icon: Icons.portrait, layoutSelection: LayoutType.profile),
        ],
        onTap: _onSelectTab,
      );
    }
  }




