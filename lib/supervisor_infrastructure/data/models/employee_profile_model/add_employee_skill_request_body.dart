class AddEmployeeSkillRequestBody {
  AddEmployeeSkillRequestBody({
    required this.employeeId,
    required this.rate,
    required this.skillId,
  });

  final String employeeId;
  final int rate;
  final String skillId;

  Map<String, dynamic> toJson() {
    return {
      'employeeId': employeeId,
      'rate': rate,
      'skillId': skillId,
    };
  }
}
