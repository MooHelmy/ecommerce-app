import 'package:e_commapp/Data/models/proudct_model.dart';
import 'package:e_commapp/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class custom_item extends StatelessWidget {
  const custom_item({
    super.key,
    required this.proudctmo,
    this.ontap,
    this.icon,
    this.onpressed,
  });
  final proudct_model proudctmo;
  final void Function()? ontap, onpressed;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: GestureDetector(
        onTap: ontap,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 40,
                        color: Colors.grey,
                        spreadRadius: 0,
                        offset: Offset(1, 1))
                  ]),
              child: Card(
                clipBehavior: Clip.none,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: SizeConfig.defaultSize! * 2,
                      ),
                      Text(
                        'name :${proudctmo.name}',
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.yellowAccent),
                            child: Text(
                              r' $ ' '${proudctmo.price}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          IconButton(onPressed: onpressed, icon: Icon(icon))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                right: SizeConfig.defaultSize! * 2,
                top: -SizeConfig.defaultSize! * 5,
                child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue,
                    backgroundImage: NetworkImage(proudctmo.location))),
          ],
        ),
      ),
    );
  }
}
