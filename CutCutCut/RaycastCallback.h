//
//  RaycastCallback.h
//  CutCutCut
//
//  Created by Allen Benson G Tan on 5/21/12.
//  Copyright (c) 2012 WhiteWidget Inc. All rights reserved.
//

#ifndef CutCutCut_RaycastCallback_h
#define CutCutCut_RaycastCallback_h

#import "Box2D.h"
#import "PolygonSprite.h"

#define collinear(x1,y1,x2,y2,x3,y3) fabsf((y1-y2) * (x1-x3) - (y1-y3) * (x1-x2))

class RaycastCallback : public b2RayCastCallback
{
public:
    RaycastCallback(){
    }
    
    float32 ReportFixture(b2Fixture *fixture,const b2Vec2 &point,const b2Vec2 &normal,float32 fraction)
    {
        PolygonSprite *ps = (PolygonSprite*)fixture->GetBody()->GetUserData();
        if (!ps.sliceEntered)
        {
            ps.sliceEntered = YES;
            
            //we need to get the point coordinates within the shape
            ps.entryPoint  = ps.body->GetLocalPoint(point);
            
            //we also need to store the slice entry time so that there's a time limit for each slice to complete
            ps.sliceEntryTime = CACurrentMediaTime() + 1;
        }
        else if (!ps.sliceExited)
        {
            ps.exitPoint = ps.body->GetLocalPoint(point);
            b2Vec2 entrySide = ps.entryPoint - ps.centroid;
            b2Vec2 exitSide = ps.exitPoint - ps.centroid;
            
            if (entrySide.x * exitSide.x < 0 || entrySide.y * exitSide.y < 0)
            {
                ps.sliceExited = YES;
            }
            else {
                //if the cut didn't cross the centroid, we check if the entry and exit point lie on the same line
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


