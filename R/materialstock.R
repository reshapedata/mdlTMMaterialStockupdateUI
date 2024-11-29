#' materialstock_update生成器界面
#'
#' @param colTitles  主页标题
#' @param widthRates 左右比例
#' @param func_left 左函数
#' @param func_right 右函数
#' @param tabTitle 标题
#' @param func_bottom  下面一栏
#'
#' @return 返回值
#' @import tsui
#' @export
#'
#' @examples
#' materialstock_updateUI()
materialstock_updateUI <- function(tabTitle ='天铭数据中台',
                                   colTitles =c('操作区域','操作区域','显示区域'),
                                   widthRates =c(6,6,12),
                                   func_left = materialstock_updateUI_left,
                                   func_right =materialstock_updateUI_right,
                                   func_bottom = materialstock_updateUI_bottom
) {

  #三栏式设置，可以复制
  res = tsui::uiGen3(tabTitle = tabTitle,colTitles =colTitles,widthRates = widthRates,func_left = func_left,func_right = func_right,func_bottom = func_bottom )
  return(res)

}





#' 请输入文件
#'
#' @return 返回值
#' @export
#'
#' @examples
#' materialstock_updateUI_left()
materialstock_updateUI_left <- function() {


  res <- tagList(
    tsui::uiTemplate(templateName = '物料库存更新模板'),
    tsui::mdl_file(id = 'file_materialstock_update', label = '上传需要更新的数据')


  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' materialstock_updateUI_bottom()
materialstock_updateUI_right <- function() {
  res <- tagList(

    shiny::actionButton(inputId = 'btn_materialstock_update_view' , label = '预览文件数据'),
    shiny::actionButton(inputId = 'btn_materialstock_update_update' , label = '更新物料库存数据')
  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' materialstock_updateUI_bottom()
materialstock_updateUI_bottom <- function() {
  res <- tagList(
    tsui::uiScrollX(tsui::mdl_dataTable(id = 'dt_materialstock_update_res'))

  )
  return(res)

}
