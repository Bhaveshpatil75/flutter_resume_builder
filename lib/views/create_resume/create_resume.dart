import 'package:flutter/material.dart';
import 'package:resume_builder_app/utils/routes/app_colors.dart';
import 'package:resume_builder_app/views/create_resume/children/education.dart';
import 'package:resume_builder_app/views/create_resume/children/experience.dart';
import 'package:resume_builder_app/views/create_resume/children/hobbies.dart';
import 'package:resume_builder_app/views/create_resume/children/personal_details.dart';
import 'package:resume_builder_app/views/create_resume/children/skills.dart';
import 'package:resume_builder_app/views/create_resume/state/create_resume_state.dart';
import 'package:resume_builder_app/views/widgets/app_bar.dart';
import 'package:resume_builder_app/views/widgets/bg_gradient_color.dart';
import 'package:resume_builder_app/views/widgets/custom_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CreateResume extends ConsumerStatefulWidget {
  const CreateResume({super.key});
  @override
  ConsumerState<CreateResume> createState() => _CreateResumeState();
}

class _CreateResumeState extends ConsumerState<CreateResume> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar().build(context,'Resume'),
      body: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sections',style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 18.sp,fontWeight: FontWeight.bold),),
            sectionSubTitle(Icons.person,'Personal Details',PersonalDetails()),
            sectionSubTitle(Icons.school,'Education',EducationalDetails()),
            sectionSubTitle(Icons.work_history_outlined,'Experience',ExperienceDetails()),
            sectionSubTitle(Icons.security_rounded,'Skills',SkillsDetails()),
            sectionSubTitle(Icons.group_work_outlined,'Hobbies',HobbiesDetails()),
          ],
        ),
      ),
      bottomSheet: SizedBox(
        width: 1.sw,
        child: CustomButton(
          title: 'View CV',
          borderRadius: BorderRadius.zero,
        ),
      ),
    );
  }

 Widget sectionSubTitle(IconData icon,String title,Widget child){
   return SizedBox(
     width: 1.sw,
     child: InkWell(
       onTap: (){
         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>child));
       },
       child: Card(
         elevation: 2,
         margin: EdgeInsets.only(top: 8.h),
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(8.sp)
         ),
         child: Padding(
           padding: EdgeInsets.only(top: 8.0.h,bottom: 12.h,left: 8.w,right: 8.w),
           child: Row(
             children: [
               ClipRRect(
                   borderRadius: BorderRadius.circular(8.sp),
                   child: BgGradientColor(child: Padding(
                     padding: EdgeInsets.all(4.0.sp),
                     child: Icon(icon,color: Colors.white,size: 20.sp,),
                   ))),
               SizedBox(width: 8.w,),
               Text(title,style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 16.sp,color: Colors.black.withOpacity(0.7)),)
             ],
           ),
         ),
       ),
     ),
   );
  }
}
