import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bruno/bruno.dart';
import 'package:image_picker/image_picker.dart';
import './info_controller.dart';
import '../../../config/brnRowDelegate.dart';

List<Map<String, List>> typeList = [
  {
    '联系1': [
      {
        '联系1': ['8', '9']
      }
    ]
  },
  {
    '类型2': [
      {
        '类型2': ['5', '6']
      }
    ]
  },
  {
    '类型3': [
      {
        '类型3': ['3', '4']
      }
    ]
  },
  {
    '类型4': [
      {
        '类型4': ['1', '2']
      },
    ]
  }
];

List<Map<String, List>> cityList = [
  {
    'AAA': [
      {
        'AAA': ['8', '9']
      }
    ]
  },
  {
    'BBB': [
      {
        'BBB': ['5', '6']
      }
    ]
  },
  {
    'CCC': [
      {
        'CCC': ['3', '4']
      }
    ]
  },
  {
    'DDD': [
      {
        'DDD': ['1', '2']
      },
      {
        'DDD1': ['EEE1', 'EEE2']
      }
    ]
  }
];

class MyselfInfoView extends GetView<MyselfInfoController> {
  const MyselfInfoView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('店铺信息'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const Divider(color: Color(0xffeeeeee)),
          BrnTextInputFormItem(
            title: "商家名称",
            hint: "请输入",
            isRequire: true,
            onChanged: (newValue) {
              BrnToast.show("点击触发回调_${newValue}_onChanged", context);
            },
          ),
          const Divider(color: Color(0xffeeeeee)),
          BrnTextInputFormItem(
            title: "联系人姓名",
            hint: "请输入",
            isRequire: true,
            onChanged: (newValue) {
              BrnToast.show("点击触发回调_${newValue}_onChanged", context);
            },
          ),
          const Divider(color: Color(0xffeeeeee)),
          BrnTextInputFormItem(
            title: "联系电话",
            hint: "请输入",
            isRequire: true,
            onChanged: (newValue) {
              BrnToast.show("点击触发回调_${newValue}_onChanged", context);
            },
          ),
          const Divider(color: Color(0xffeeeeee)),
          BrnTextSelectFormItem(
            title: "商家类型",
            isRequire: true,
            onTap: () {
              BrnMultiDataPicker(
                context: context,
                title: '商家类型',
                delegate:
                    Brn1RowDelegate(list: typeList, firstSelectedIndex: 1),
                confirmClick: (list) {
                  BrnToast.show(list.toString(), context);
                },
              ).show();
            },
          ),
          const Divider(color: Color(0xffeeeeee)),
          BrnTextSelectFormItem(
            title: "所在城市",
            isRequire: true,
            onTap: () {
              BrnMultiDataPicker(
                context: context,
                title: '所在城市',
                delegate: Brn3RowDelegate(
                  list: cityList,
                  firstSelectedIndex: 0,
                  secondSelectedIndex: 0,
                  thirdSelectedIndex: 0,
                ),
                confirmClick: (list) {
                  BrnToast.show(list.toString(), context);
                },
              ).show();
            },
          ),
          const Divider(color: Color(0xffeeeeee)),
          BrnTextBlockInputFormItem(
            // controller: TextEditingController()..text = "hello",
            title: "店铺地址",
            isRequire: true,
            minLines: 2,
            maxLines: 5,
            onChanged: (newValue) {
              BrnToast.show("点击触发回调_${newValue}_onChanged", context);
            },
          ),
          const Divider(color: Color(0xffeeeeee)),
          BrnBigMainButton(
            title: '选择图片',
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (BuildContext context) {
                    return BrnCommonActionSheet(
                      title: "",
                      actions: [
                        BrnCommonActionSheetItem(
                          '拍照',
                          actionStyle: BrnCommonActionSheetItemStyle.normal,
                        ),
                        BrnCommonActionSheetItem(
                          '相册',
                          actionStyle: BrnCommonActionSheetItemStyle.normal,
                        )
                      ],
                      clickCallBack: (
                        int index,
                        BrnCommonActionSheetItem actionEle,
                      ) async {
                        String title = actionEle.title;
                        BrnToast.show("title: $title, index: $index", context);
                        ImageSource source = index == 0
                            ? ImageSource.camera
                            : ImageSource.gallery;
                        final ImagePicker picker = ImagePicker();
                        final XFile? image =
                            await picker.pickImage(source: source);
                        if (image == null) return;
                        print('fileContent------${image.path}');

                        /* 
                        // Pick a video.
                        final XFile? galleryVideo =
                            await picker.pickVideo(source: ImageSource.gallery);
                        // Capture a video.
                        final XFile? cameraVideo =
                            await picker.pickVideo(source: ImageSource.camera);
                        // Pick multiple images.
                        final List<XFile> images =
                            await picker.pickMultiImage();
                        // Pick singe image or video.
                        final XFile? media = await picker.pickMedia();
                        // Pick multiple images and videos.
                        final List<XFile> medias =
                            await picker.pickMultipleMedia(); 
                            */
                      },
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
