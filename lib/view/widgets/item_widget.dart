
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.title, required this.data});
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width:(kIsWeb) ? MediaQuery.of(context).size.height *0.4 :MediaQuery.of(context).size.height *0.25,
      height:  (kIsWeb) ?MediaQuery.of(context).size.height *0.25:MediaQuery.of(context).size.height *0.4,
      decoration: BoxDecoration(
          border: Border.all(width: 5,color: const Color(0xFF466EF9)),
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: Colors.white

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            child: Center(
              child: Text(title,
                maxLines: 2,
                textAlign: TextAlign.center,
                style:  TextStyle(
                  color:  const Color(0xFF466EFA),
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                    fontFamily: 'Montserrat',
                  shadows: [
                    Shadow(color: const Color(0xFF466EF9).withOpacity(0.3),offset: const Offset(0,5))
                  ]
              ),),
            ),
          ),
          const SizedBox(height: 20,),
          Center(
            child: FittedBox(
              child: Text(data,
                maxLines: 2,
                style: const TextStyle(
                  color:  Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 40,
                  fontFamily: 'Montserrat',

              ),),
            ),
          ),
        ],
      ),
    );
  }
}
