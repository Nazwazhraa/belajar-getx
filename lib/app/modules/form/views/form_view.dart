import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/app/modules/form/controllers/form_controller.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart'; 
import '../views/output.dart';

class FormView extends GetView<FormController> {
  const FormView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan Form'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nama Lengkap'),
                onChanged: (value) => controller.namalengkap.value = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Tempat Lahir'),
                onChanged: (value) => controller.tempatlahir.value = value,
              ),
              Obx(
                () => TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Tanggal Lahir',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () => controller.selectDate(context),
                    ),
                  ),
                  readOnly: true,
                  controller: TextEditingController(text: controller.selectedDate.value),
                  onTap: () => controller.selectDate(context),
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                onChanged: (value) => controller.email.value = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Negara'),
                onChanged: (value) => controller.negara.value = value,
              ),
              const SizedBox(height: 16),
              const Text('Pilih Jenis Member:'),
              const SizedBox(height: 8),
              Obx(
                () => Wrap(
                  children: controller.memberList.map((memberType) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: FilterChip(
                        label: Text(memberType),
                        selected: controller.selectedMember.value == memberType,
                        onSelected: (selected) =>
                            controller.toggleMember(memberType),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nomor Kartu'),
                onChanged: (value) => controller.nomorkartu.value = value,
                style: const TextStyle(fontSize: 16),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              Obx(
                () => TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Tanggal Expired',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () => controller.selectDate(context, isExpiredDate: true),
                    ),
                  ),
                  readOnly: true,
                  controller: TextEditingController(
                    text: controller.tanggalExpired.value != null
                      ? DateFormat('yyyy-MM-dd').format(controller.tanggalExpired.value!)
                      : ''
                  ),
                  onTap: () => controller.selectDate(context, isExpiredDate: true),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Payment:',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Obx(
                () => Text(
                  'Harga Member: ${controller.totalHarga.value}',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {  
                  Get.to(() => const OutputPage());
                },  
                child: const Text('Submit'),
              ),
              Obx(
                () => controller.isFormSubmitted.value
                    ? const Text('Formulir sudah disubmit!')
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}