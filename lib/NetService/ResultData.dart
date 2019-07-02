/**
 * Created by ZWP on 2019/7/1 14:38.
 * 描述：数据返回基类
 */
class ResultData{
    var data;
    //true 表示返回成功 false 表示返回失败
    bool resultStatue;

    ResultData(this.data, this.resultStatue);
}