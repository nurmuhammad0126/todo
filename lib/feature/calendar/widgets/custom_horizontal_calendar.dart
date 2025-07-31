import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo/core/extensions/color_extension.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_style.dart';
import '../../../core/widgets/w_container.dart';

class CustomHorizontalCalendar extends StatefulWidget {
  const CustomHorizontalCalendar({super.key});

  @override
  State<CustomHorizontalCalendar> createState() =>
      _CustomHorizontalCalendarState();
}

class _CustomHorizontalCalendarState extends State<CustomHorizontalCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now(); // 9-fevral tanlangan

  @override
  Widget build(BuildContext context) {
    return WContainer(
      color: AppColors.greyDark,
      width: double.infinity,
      child: TableCalendar<dynamic>(
        firstDay: DateTime(2000),
        lastDay: DateTime(2050),
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },

        calendarFormat: CalendarFormat.week,
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          leftChevronIcon: Icon(Icons.chevron_left, color: AppColors.surface),
          rightChevronIcon: Icon(Icons.chevron_right, color: AppColors.surface),
          titleTextFormatter: (date, locale) {
            return '${_getMonthName(date.month).toUpperCase()}\n${date.year}';
          },
          titleTextStyle: AppTextStyles.s14w400.copyWith(
            color: AppColors.surface,
            height: 1.2,
          ),
          headerPadding: EdgeInsets.symmetric(vertical: 8),
        ),

        // Days of week style
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: AppTextStyles.s12w400.copyWith(
            color: AppColors.surface.withOpacityNew(0.7),
          ),
          weekendStyle: AppTextStyles.s12w400.copyWith(
            color: AppColors.error, // SAT, SUN uchun qizil rang
          ),
        ),

        // Calendar style
        calendarStyle: CalendarStyle(
          outsideDaysVisible: false,
          weekendTextStyle: AppTextStyles.s16w400.copyWith(
            color: AppColors.error, // Weekend kunlari uchun qizil
          ),
          defaultTextStyle: AppTextStyles.s16w400.copyWith(
            color: AppColors.surface,
          ),

          // Tanlangan kun uchun style
          selectedDecoration: BoxDecoration(
            color: AppColors.primary, // Yoki ko'k rang
            shape: BoxShape.circle,
          ),
          selectedTextStyle: AppTextStyles.s16w400.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),

          // Bugungi kun uchun style
          todayDecoration: BoxDecoration(
            color: AppColors.primary.withOpacityNew(0.3),
            shape: BoxShape.circle,
          ),
          todayTextStyle: AppTextStyles.s16w400.copyWith(
            color: AppColors.surface,
          ),

          // Celllar orasidagi margin
          cellMargin: EdgeInsets.all(4),
          cellPadding: EdgeInsets.zero,
        ),

        // Calendar builders - custom widget'lar uchun
        calendarBuilders: CalendarBuilders(
          // Weekend kunlari uchun maxsus builder
          dowBuilder: (context, day) {
            final text = _getDayOfWeekName(day.weekday);
            return Center(
              child: Text(
                text,
                style: AppTextStyles.s12w400.copyWith(
                  color:
                      (day.weekday == DateTime.saturday ||
                          day.weekday == DateTime.sunday)
                      ? AppColors.error
                      : AppColors.surface.withOpacityNew(0.7),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Oy nomini olish
  String _getMonthName(int month) {
    const months = [
      '',
      'JANUARY-1',
      'FEBRUARY-2',
      'MARCH-3',
      'APRIL-4',
      'MAY-5',
      'JUNE-6',
      'JULY-7',
      'AUGUST-8',
      'SEPTEMBER-9',
      'OCTOBER-10',
      'NOVEMBER-11',
      'DECEMBER-12',
    ];
    return months[month];
  }

  // Hafta kunlari nomini olish
  String _getDayOfWeekName(int weekday) {
    const days = ['', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
    return days[weekday];
  }
}
