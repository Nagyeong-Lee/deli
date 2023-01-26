package kh.deli.domain.member.order.mapper;

import kh.deli.domain.member.order.dto.*;
import kh.deli.global.entity.OrdersDTO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
@Mapper
public interface OrderOrdersMapper {
    public OrderOrdersDTO selectSessionInfo(@Param("orderOrdersDTO") OrderOrdersDTO ordersDTO);
    public OrderOrdersDTO selectOrderMemberInfo(@Param("accSeq") int accSeq);
    List<OrderOrdersDTO> selectCouponList(@Param("accSeq") Integer accSeq);

    public void updateMemberAddr(@Param("orderOrdersDTO") OrderOrdersDTO ordersDTO);

    public int updateMemberPhone(@Param("orderOrdersDTO")OrderOrdersDTO ordersDTO);


    StoreInfoDTO getStoreInfo(int order_seq);

    OrdererInfoDTO getOrdererInfo(int order_seq);

    PayInfoDTO getPayInfo(int order_seq);

    @Insert("insert into orders values(" +
            "order_seq.nextval, 31, 19, #{menu_list}, 19996216, sysdate, 777, '123', " +
            "'01039300596', 'take', 'Y','빨리와주세요', '카카오페이', 0, 0, '샘플바스켓', 5000, 20001216 )")
    void insertSampleBasket(@Param("menu_list") String menu_list);

    @Select("select * from orders where order_seq = #{order_seq}")
    OrdersDTO findOrdersBySeq(int order_seq);

    void insertOrder(@Param("orderOrdersDTO") OrderOrdersDTO orderOrdersDTO, @Param("orderSeq") int orderSeq);

    // UpdateCouponList, UpdateOwnPointMinus, UpdateOwnPointPlus

    void deleteCouponList(@Param("orderOrderDTO") OrderOrdersDTO orderOrdersDTO);

    void updateOwnPoint(@Param("orderOrderDTO")OrderOrdersDTO orderOrdersDTO);

    @Select("SELECT ORDER_SEQ.NEXTVAL FROM DUAL")
    int getNextSeq();
}
