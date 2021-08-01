pragma solidity 0.8.0;






contract swap {
     address private constant UNISWAP_V2_ROUTER = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
     address private constant WETH = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    
     function tooswap()external  {
              address tokenin=0x5592EC0cfb4dbc12D3aB100b257153436a1f0FEa;
              uint256 num1=1*10**18;
              //IERC20(tokenin).approve(address(this),num1);
              require(IERC20(tokenin).transferFrom(msg.sender,address(this),num1),"Failed transfer");
              require(IERC20(tokenin).approve(UNISWAP_V2_ROUTER,num1),"Fail approval");
              
              
              address[] memory path = new address[](2);
              path[0]=0x5592EC0cfb4dbc12D3aB100b257153436a1f0FEa;
              path[1]=IUniswapV2Router(UNISWAP_V2_ROUTER).WETH();
              
              IUniswapV2Router(UNISWAP_V2_ROUTER).swapExactTokensForETH(num1,0,path,msg.sender,block.timestamp+200);
              
              
     }
    
}

interface IERC20 {
    function totalSupply() external view returns (uint);
    function balanceOf(address account) external view returns (uint);
    function transfer(address recipient, uint amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint);
    function approve(address spender, uint amount) external returns (bool);
    function transferFrom(
        address sender,
        address recipient,
        uint amount
    ) external returns (bool);
    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
}


interface IUniswapV2Router {
  

  function swapExactTokensForETH(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        returns (uint[] memory amounts);
  function WETH() external pure returns (address);

}




