import 'package:currency/config/config.dart';
import 'package:currency/view_models/view_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double _kPickerSheetHeight = 30.h;
  BitCoinViewModel? bitCoinViewModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      bitCoinViewModel = Provider.of<BitCoinViewModel>(context, listen: false);
      bitCoinViewModel?.getBitcoin();
      openModal();
    });
  }

  openModal() {
    showCupertinoModalPopup<void>(
        barrierColor: Colors.transparent,
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return _buildBottomPicker(_buildCupertinoPicker());
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              Container(
                width: SizerUtil.deviceType == DeviceType.web ? 20.w : 40.w,
                height: SizerUtil.deviceType == DeviceType.web ? 20.w : 40.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/bitcoin.png",
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Consumer<BitCoinViewModel>(
                builder: (context, bitCoinViewModel, _) {
                  return bitCoinViewModel.isLoading
                      ? const CircularProgressIndicator.adaptive(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AppColor.largeTextColor,
                          ),
                        )
                      : Text(
                          "${bitCoinViewModel.selectedPrice}",
                          style: Theme.of(context).textTheme.displayLarge,
                          textAlign: TextAlign.center,
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomPicker(Widget picker) {
    return Container(
      height: _kPickerSheetHeight,
      padding: const EdgeInsets.only(top: 6.0),
      color: Colors.transparent,
      child: DefaultTextStyle(
        style: const TextStyle(
          color: CupertinoColors.black,
          fontSize: 16.0,
        ),
        child: GestureDetector(
          onTap: () {},
          child: SafeArea(
            top: false,
            child: picker,
          ),
        ),
      ),
    );
  }

  Widget _buildCupertinoPicker() {
    return CupertinoPicker(
        magnification: 1.5,
        itemExtent: 50,
        looping: true,
        children: context
            .read<BitCoinViewModel>()
            .currencyArray
            .map((item) => Center(
                  child: Text(
                    item,
                    style: const TextStyle(fontSize: 18),
                  ),
                ))
            .toList(),
        onSelectedItemChanged: (index) {
          context.read<BitCoinViewModel>().onCurrencyChnaged(index);
        });
  }
}
