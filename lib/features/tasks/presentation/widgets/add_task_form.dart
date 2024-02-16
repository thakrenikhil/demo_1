import 'package:clean_todo/core/utils/extensions/failure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../../../core/utils/size_utils.dart';
import '../../tasks.dart';
import '../controllers/task_controller.dart';
import '../states/task_state.dart';
import 'custom_button.dart';
import 'custom_text_form_field.dart';

class AddTaskForm extends ConsumerStatefulWidget {
  const AddTaskForm({
    super.key,
  });

  @override
  ConsumerState<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends ConsumerState<AddTaskForm> {
  final formKey = GlobalKey<FormState>();
  final taskTitleController = TextEditingController();

  void submit() {
    final taskController = ref.read(taskProvider.notifier);
    taskController.saveTask(taskTitleController.text.trim());
  }

  String? mapValidationFailureToMessage(context, ValidationFailure? failure) {
    if (failure is EmptyFieldFailure) {
      return AppLocalizations.of(context)!.emptyFieldError;
    }

    if (failure != null) {
      return failure.toMessage(context);
    }

    return null;
  }

  void navigateBack() {
    context.pop();
  }

  @override
  void dispose() {
    super.dispose();
    taskTitleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(taskProvider, (prevState, state) {
      if (state is TaskAdded) {
        navigateBack();
      }
    });

    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            focusNode: FocusNode(),
            controller: taskTitleController,
            hintText: AppLocalizations.of(context)!.taskTitleHint,
            margin: getMargin(top: 75),
            maxLength: 10,
            // readOnly: controller.requestedOtp.value,
            inputType: TextInputType.name,
            validator: (value) {
              final failure = TaskValidator.validateTitle(value!);
              return mapValidationFailureToMessage(context, failure);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            height: 40,
            width: 316,
            text: "Add Task",
            onTap: () {
              if (formKey.currentState!.validate()) submit();
            },
            imagePath: '',
          ),
        ],
      ),
    );
  }
}
