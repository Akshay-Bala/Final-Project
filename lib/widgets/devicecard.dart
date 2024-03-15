import 'package:flutter/material.dart';

class DeviceCard extends StatefulWidget {
  const DeviceCard({
    Key? key,
   // required this.navigation,
    required this.activeColor,
    required this.deviceIcon,
    required this.connectionIcon,
    required this.initialActiveState,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
 // final navigation;
  final MaterialColor activeColor;
  final IconData deviceIcon;
  final IconData connectionIcon;
  final bool initialActiveState;
  final String title;
  final String subtitle;

  @override
  _DeviceCardState createState() => _DeviceCardState();
}

class _DeviceCardState extends State<DeviceCard> {
  late bool isActive;

  @override
  void initState() {
    isActive = widget.initialActiveState;
    super.initState();
  }

  void toggleActiveState() {
    //widget.navigation;
    setState(() {
      isActive = !isActive;
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 180,
      width: double.infinity,
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isActive ? widget.activeColor : Colors.white.withOpacity(.8),
        borderRadius: BorderRadius.circular(35),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                widget.deviceIcon,
                color: isActive ? Colors.white : widget.activeColor,
                size: 50,
              ),
              Icon(
                widget.connectionIcon,
                color: isActive ? Colors.white : Colors.grey,
                size: 20,
              ),
            ],
          ),
          Text(
            widget.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isActive ? Colors.white : Colors.black,
            ),
          ),
          Text(
            widget.subtitle,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              color: isActive ? Colors.white : Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
