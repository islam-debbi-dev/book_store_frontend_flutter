import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../logic/admin_home_cubit.dart';
import 'package:flutter/cupertino.dart';

Widget FilterButton(context) {
  return Container(
    margin: const EdgeInsets.only(right: 8),
    child: IconButton(
      icon: Icon(
        Icons.filter_list,
        color: Colors.white,
        size: 24,
      ),
      onPressed: () {
        //show filter dialog
        showPriceFilterDialog(context, (min, max) {
          min = 0;
          max = 1000;
          BlocProvider.of<AdminHomeCubit>(context).filterBooks(min, max);
        });
      },
      splashRadius: 24,
      tooltip: 'Filter',
    ),
  );
}

void showPriceFilterDialog(
    BuildContext context, void Function(int min, int max) onFilter) {
  final minController = TextEditingController();
  final maxController = TextEditingController();

  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: Text(
          'Filter by Price',
          style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
        ),
        content: Column(
          children: [
            SizedBox(height: 16),
            CupertinoTextField(
              placeholderStyle: Theme.of(context).textTheme.bodySmall,
              controller: minController,
              placeholder: 'Min Price',
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12),
            CupertinoTextField(
              placeholderStyle: Theme.of(context).textTheme.bodySmall,
              controller: maxController,
              placeholder: 'Max Price',
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          CupertinoDialogAction(
            child:
                Text('Cancel', style: Theme.of(context).textTheme.bodyMedium),
            onPressed: () => Navigator.of(context).pop(),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            child:
                Text('Filter', style: Theme.of(context).textTheme.bodyMedium),
            onPressed: () {
              final min = int.tryParse(minController.text) ?? 0;
              final max = int.tryParse(maxController.text) ?? 1000;
              onFilter(min, max);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
