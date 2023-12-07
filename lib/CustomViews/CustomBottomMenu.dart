import 'package:flutter/material.dart';

class CustomBottomMenu extends StatelessWidget {
  CustomBottomMenu({Key? key, required this.onBotonesClicked}) : super(key: key);
  Function(int indice)? onBotonesClicked;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.inversePrimary,
            width: 0.2,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            ElevatedButton.icon(
              onPressed: () => onBotonesClicked!(0),
              icon: Icon(
                  Icons.list,
                  color: Theme.of(context).colorScheme.inversePrimary,
              ),
              label: Text("Lista",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary
                  )
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor:  Colors.transparent,
                shadowColor: Colors.transparent,
              ),
            ),

            ElevatedButton.icon(
              onPressed: () => onBotonesClicked!(1),
              icon: Icon(
                  Icons.grid_view,
                  color: Theme.of(context).colorScheme.inversePrimary
              ),
              label: Text("Cuadrícula",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary
                  )
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor:  Colors.transparent,
                shadowColor: Colors.transparent,
              ),
            ),

            ElevatedButton.icon(
              onPressed: () => onBotonesClicked!(2),
              icon: Icon(
                  Icons.exit_to_app,
                  color: Theme.of(context).colorScheme.inversePrimary
              ),
              label: Text("Salir",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary
                  )
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor:  Colors.transparent,
                shadowColor: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
