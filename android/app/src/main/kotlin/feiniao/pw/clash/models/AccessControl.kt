package feiniao.pw.clash.models

enum class AccessControlMode {
    acceptSelected,
    rejectSelected,
}

data class AccessControl(
    val mode: AccessControlMode,
    val acceptList: List<String>,
    val rejectList: List<String>,
)
