//
//  RayCastCallback.h
//  CutCutCut
//
//  Created by Chao Xu on 13-10-24.
//  Copyright (c) 2013年 Chao Xu. All rights reserved.
//

#ifndef CutCutCut_RaycastCallback_h
#define CutCutCut_RaycastCallback_h
#define collinear(x1,y1,x2,y2,x3,y3) fabsf((y1-y2)*(x1-x3)-(y1-y3)*(x1-x2))
#import "Box2D.h"
#import "PolygonSprite.h"

class RaycastCallback : public b2RayCastCallback
{
public:
    RaycastCallback(){
    }
    /**
     每当Box2D检测到一次接触，就会调用ReportFixture方法。如果多边形还没有切割线进入，那么就把相交点设置为entry point，如果已经有切割线进入了，就把相交点设置为exit point。
     **/
    float32 ReportFixture(b2Fixture *fixture,const b2Vec2 &point,const b2Vec2 &normal,float32 fraction)
    {
        PolygonSprite *ps = (PolygonSprite*)fixture->GetBody()->GetUserData();
        if (!ps.sliceEntered)
        {
            ps.sliceEntered = YES;
            
            //you need to get the point coordinates within the shape
            ps.entryPoint  = ps.body->GetLocalPoint(point);
            
            ps.sliceEntryTime = CACurrentMediaTime() + 1;
            
        }
        else if (!ps.sliceExited)
        {
            ps.exitPoint = ps.body->GetLocalPoint(point);
            //在接受一个结束点之前，这个回调函数检查两点的位置，如果起始点和结束点处在多边形中心点的两侧，那么这次切割是合理的。
           // 如果不在多边形中心点的两侧，那么继续检测切割线起始点和结束点是否在原图形所有的顶点形成的线上。如果他们在一条线上，那么就意味着相交点是另一个起始点，否则，就是一次完整的切割。
            b2Vec2 entrySide = ps.entryPoint - ps.centroid;
            b2Vec2 exitSide = ps.exitPoint - ps.centroid;
            
            if (entrySide.x * exitSide.x < 0 || entrySide.y * exitSide.y < 0)
            {
                ps.sliceExited = YES;
            }
            else {
                //if the cut didn't cross the centroid, you check if the entry and exit point lie on the same line
                b2Fixture *fixture = ps.body->GetFixtureList();
                b2PolygonShape *polygon = (b2PolygonShape*)fixture->GetShape();
                int count = polygon->GetVertexCount();
                
                BOOL onSameLine = NO;
                for (int i = 0 ; i < count; i++)
                {
                    b2Vec2 pointA = polygon->GetVertex(i);
                    b2Vec2 pointB;
                    
                    if (i == count - 1)
                    {
                        pointB = polygon->GetVertex(0);
                    }
                    else {
                        pointB = polygon->GetVertex(i+1);
                    }//endif
                    
                    float collinear = collinear(pointA.x,pointA.y, ps.entryPoint.x, ps.entryPoint.y, pointB.x,pointB.y);
                    
                    if (collinear <= 0.00001)
                    {
                        float collinear2 = collinear(pointA.x,pointA.y,ps.exitPoint.x,ps.exitPoint.y,pointB.x,pointB.y);
                        if (collinear2 <= 0.00001)
                        {
                            onSameLine = YES;
                        }
                        break;
                    }//endif
                }//endfor
                
                if (onSameLine)
                {
                    ps.entryPoint = ps.exitPoint;
                    ps.sliceEntryTime = CACurrentMediaTime() + 1;
                    ps.sliceExited = NO;
                }
                else {
                    ps.sliceExited = YES;
                }//endif
            }
        }
        return 1;
    }
};

#endif






























